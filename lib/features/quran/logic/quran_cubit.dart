import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:noor/core/database/quran/quran_database.dart';
import 'package:noor/core/di/dependency_injection.dart';
import 'package:noor/core/shared_preferences/shared_preferences_keys.dart';
import 'package:noor/features/quran/data/models/reading_position.dart';
import 'package:noor/features/quran/data/repos/quran_repo.dart';
import 'package:noor/features/quran/logic/quran_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class QuranCubit extends Cubit<QuranState> {
  final QuranRepo _quranRepo;
  List<(Surah, List<Verse>)> _surahs = [];
  ValueNotifier<ReadingPosition?> currentReadingPositionNotifier =
      ValueNotifier(null);
  final AudioPlayer _audioPlayer = AudioPlayer();
  QuranCubit(this._quranRepo) : super(QuranInitial());
  (int, int)? _currcetPosition;  
  ValueNotifier<Surah?> currentSurahNotifier =
      ValueNotifier(null);

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

  Future<void> getSuras() async {
    final result = await Future.wait([
      _quranRepo.getSurahs(),
      _quranRepo.getChaptersVerses(),
    ]);
    final surahs = result[0] as List<Surah>;
    final verses = result[1] as List<Verse>;
    if (!isClosed) {
      emit(SurahsLoaded(surahs: surahs, verses: verses));
    }
  }

  Future<void> saveLastReading(
    int surahNumber,
    int verseNumber,
    int juzNumber,
  ) async {
    final surah = await _quranRepo.getSurahDetails(surahNumber: surahNumber);

    final surahInfo = surah;

    getIt.get<SharedPreferences>().setString(
      SharedPreferencesKeys.lastReading,
      jsonEncode(<String, dynamic>{
        "readingPosition": ReadingPosition(
          juz: juzNumber,
          surahNumber: surahInfo.number,
          surahName: surahInfo.nameAr,
          verseNumber: verseNumber,
          pageNumber: surahInfo.pageNumber,
        ),
        "suraNameEn": surahInfo.nameTransliteration,
      }),
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

  Future<void> dispose() async {
    if (currentReadingPositionNotifier.value != null) {
      final ReadingPosition readingPosition =
          currentReadingPositionNotifier.value!;

      await saveLastReading(
        readingPosition.surahNumber,
        readingPosition.verseNumber,
        readingPosition.juz,
      );
    }
    _audioPlayer.dispose();
    currentReadingPositionNotifier.dispose();
  }

  Future<void> updateReadingPosition(
    int surahNumber,
    int verseNumber,
    int juzNumber,
    int pageNumber,
  ) async {
    final surahInfo = await _quranRepo.getSurahDetails(
      surahNumber: surahNumber,
    );

    currentSurahNotifier.value = surahInfo;
    currentReadingPositionNotifier.value = ReadingPosition(
      juz: juzNumber,
      surahNumber: surahInfo.number,
      surahName: surahInfo.nameAr,
      verseNumber: verseNumber,
      pageNumber: pageNumber,
    );
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
        ifLeft: (failure) => emit(AyahSoundError(
          message: failure.message,
          surahNumber: surahNumber,
          verseNumber: verseNumber,
        )),
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

  Future<void> getPageSound(int pageNumber, String qari) async {
    final result = await _quranRepo.getPageSound(pageNumber, qari);
    if (!isClosed) {
      result.fold(
        ifLeft: (failure) => emit(PageSoundError(failure.message)),
        ifRight: (sound) => emit(PageSoundLoaded(sound)),
      );
    }
  }
}
