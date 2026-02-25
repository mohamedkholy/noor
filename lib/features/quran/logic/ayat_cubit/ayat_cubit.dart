import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/features/quran/data/repos/quran_repo.dart';
import 'package:noor/features/quran/logic/ayat_cubit/ayat_state.dart';

@Injectable()
class AyatCubit extends Cubit<AyatState> {
  final QuranRepo _quranRepo;
  List<(Surah, List<Verse>)> _surahs = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  AyatCubit(this._quranRepo) : super(AyatInitial());
  (int, int)? _currcetPosition;

  void init() {
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed &&
          _currcetPosition != null) {
        emit(
          AudioPlayerPaused(
            surahNumber: _currcetPosition!.$1,
            verseNumber: _currcetPosition!.$2,
          ),
        );
      }
    });
  }

  void stopPlayer() {
    _audioPlayer.stop();
    emit(AudioPlayerStopped());
    _currcetPosition = null;
  }

  void pausePlayer((int, int) currentPosition) {
    _audioPlayer.pause();
    emit(
      AudioPlayerPaused(
        surahNumber: currentPosition.$1,
        verseNumber: currentPosition.$2,
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
      AyahSoundPlayed(
        surahNumber: _currcetPosition!.$1,
        verseNumber: _currcetPosition!.$2,
      ),
    );
  }

  Future<void> getReadingData(int suraNumber) async {
    _surahs = await _quranRepo.getVersesPerSura(suraNumber);
    if (!isClosed) {
      emit(QuranLoaded(_surahs));
    }
  }

  Future<void> getReadingDataPagination({
    required int suraNumber,
    required bool isFromStart,
  }) async {
    final result = await _quranRepo.getReadingDataPagination(
      suraNumber,
      isFromStart,
    );
    _surahs.addAll(result);
    if (!isClosed) {
      emit(
        isFromStart ? QuranLodedFromStart(result) : QuranLodedFromEnd(result),
      );
    }
  }

  Future<void> getAyaSound({
    required int surahNumber,
    required int verseNumber,
    required String qari,
  }) async {
    emit(AyahSoundLoading(surahNumber: surahNumber, verseNumber: verseNumber));
    final result = await _quranRepo.getAyaSound(
      "$surahNumber:$verseNumber",
      qari,
    );
    if (!isClosed) {
      result.fold(
        ifLeft: (failure) => emit(
          AyahSoundError(
            message: failure.message,
            surahNumber: surahNumber,
            verseNumber: verseNumber,
          ),
        ),
        ifRight: (sound) async {
          final url = sound.data?.audio ?? sound.data?.audioSecondary?.first;
          await _audioPlayer.pause();
          _currcetPosition = (surahNumber, verseNumber);
          emit(
            AyahSoundPlayed(surahNumber: surahNumber, verseNumber: verseNumber),
          );
          _audioPlayer.setUrl(url!);
          _audioPlayer.play();
        },
      );
    }
  }

  void _dispose() {
    _audioPlayer.dispose();
  }

  @override
  Future<void> close() {
    _dispose();
    return super.close();
  }
}
