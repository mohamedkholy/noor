import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:noor/features/quran/data/models/quran_page_sound_response/ayah.dart';
import 'package:noor/features/quran/data/repos/quran_repo.dart';
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_state.dart';

@Injectable()
class MushafCubit extends Cubit<MushafState> {
  final QuranRepo _quranRepo;
  final AudioPlayer _audioPlayer = AudioPlayer();
  ValueNotifier<bool> lastPositionNotifier = ValueNotifier(false);
  int _currcetPosition = -1;
  List<Ayah> _pageAyat = [];
  MushafCubit(this._quranRepo) : super(MushafInitial());

  void init() {
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed &&
          _currcetPosition != -1) {
        _currcetPosition++;
        if (_currcetPosition < _pageAyat.length) {
          playAyah(_currcetPosition);
          emit(
            AudioPlayerPlaying(
              pageNumber: _pageAyat[_currcetPosition].page ?? 0,
              suraNumber: _pageAyat[_currcetPosition].surah?.number ?? 0,
              ayaNumber: _pageAyat[_currcetPosition].numberInSurah ?? 0,
            ),
          );
        }
        if (_currcetPosition == _pageAyat.length) {
          emit(
            AudioPlayerPaused(
              pageNumber: _pageAyat[_currcetPosition - 1].page ?? 0,
              suraNumber: _pageAyat[_currcetPosition - 1].surah?.number ?? 0,
              ayaNumber: _pageAyat[_currcetPosition - 1].numberInSurah ?? 0,
            ),
          );
        }
      }
    });
  }

  void stopPlayer() {
    _audioPlayer.stop();
    emit(AudioPlayerStopped());
    _currcetPosition = -1;
  }

  void pausePlayer({
    required int pageNumber,
    required int suraNumber,
    required int ayaNumber,
  }) {
    _audioPlayer.pause();
    emit(
      AudioPlayerPaused(
        pageNumber: pageNumber,
        suraNumber: suraNumber,
        ayaNumber: ayaNumber,
      ),
    );
  }

  void continuePlaying() async {
    if ((await _audioPlayer.playerStateStream.first).processingState ==
        ProcessingState.completed) {
      _audioPlayer.seek(Duration.zero);
    }
    _audioPlayer.play();
    emit(
      AudioPlayerPlaying(
        pageNumber: _pageAyat[_currcetPosition].page ?? 0,
        suraNumber: _pageAyat[_currcetPosition].surah?.number ?? 0,
        ayaNumber: _pageAyat[_currcetPosition].numberInSurah ?? 0,
      ),
    );
  }

  Future<void> getSurasLines(int pageNumber) async {
    final result = await _quranRepo.getSurasLines(pageNumber);
    if (!isClosed) {
      emit(QuranLinesLoaded(result));
    }
  }

  Future<void> getSurasLinesPagination({
    required int pageNumber,
    required bool isFromStart,
  }) async {
    final pages = await _quranRepo.getSurasLines(pageNumber, isFromStart);
    if (!isClosed) {
      emit(
        isFromStart
            ? QuranLinesLodedFromStart(pages)
            : QuranLinesLodedFromEnd(pages),
      );
    }
  }

  Future<void> playAyah(
    int position, {
    int? suraNumber,
    int? verseNumber,
  }) async {
    _currcetPosition = position;
    if (suraNumber != null && verseNumber != null) {
      _currcetPosition = _pageAyat.indexWhere(
        (element) =>
            element.numberInSurah == verseNumber &&
            element.surah?.number == suraNumber,
      );
    }
    await _audioPlayer.setUrl(
      _pageAyat[_currcetPosition].audio ??
          _pageAyat[_currcetPosition].audioSecondary?.first ??
          "",
    );
    _audioPlayer.play();
    lastPositionNotifier.value = _currcetPosition == _pageAyat.length - 1;
    emit(
      AudioPlayerPlaying(
        pageNumber: _pageAyat[_currcetPosition].page ?? 0,
        suraNumber: _pageAyat[_currcetPosition].surah?.number ?? 0,
        ayaNumber: _pageAyat[_currcetPosition].numberInSurah ?? 0,
      ),
    );
  }

  Future<void> getPageSound({
    required int pageNumber,
    required int verseNumber,
    required int suraNumber,
    required String qari,
  }) async {
    emit(
      PageSoundLoading(
        pageNumber: pageNumber,
        suraNumber: suraNumber,
        ayaNumber: verseNumber,
      ),
    );
    final result = await _quranRepo.getPageSound(pageNumber, qari);
    if (!isClosed) {
      result.fold(
        ifLeft: (failure) => emit(
          PageSoundError(
            message: failure.message,
            suraNumber: suraNumber,
            ayaNumber: verseNumber,
          ),
        ),
        ifRight: (r) {
          _pageAyat = r.data!.ayahs!;
          _currcetPosition = _pageAyat.indexWhere(
            (e) =>
                e.numberInSurah == verseNumber && e.surah?.number == suraNumber,
          );
          lastPositionNotifier.value = _currcetPosition == _pageAyat.length - 1;
          playAyah(_currcetPosition);
        },
      );
    }
  }

  void _dispose() async {
    print("dispose");
    lastPositionNotifier.dispose();
    await _audioPlayer.stop();
    _audioPlayer.dispose();
  }

  @override
  Future<void> close() {
    _dispose();
    return super.close();
  }
}
