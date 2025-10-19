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
import 'package:noor/features/quran/logic/mushaf_cubit/mushaf_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class MushafCubit extends Cubit<MushafState> {
  final QuranRepo _quranRepo;
  ValueNotifier<ReadingPosition?> currentReadingPositionNotifier =
      ValueNotifier(null);
  final AudioPlayer _audioPlayer = AudioPlayer();
  MushafCubit(this._quranRepo) : super(MushafInitial());
  (int, int)? _currcetPosition;  

  // void init() {
  //   _audioPlayer.playerStateStream.listen((state) {
  //     if (state.processingState == ProcessingState.completed &&
  //         _currcetPosition != null) {
  //       emit(
  //         AudioPlayerPaused(
  //           surahNumber: _currcetPosition!.$1,
  //           verseNumber: _currcetPosition!.$2,
  //         ),
  //       );
  //     }
  //   });
  // }

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
    // emit(
    //   AyahSoundPlayed(
    //     surahNumber: _currcetPosition!.$1,
    //     verseNumber: _currcetPosition!.$2,
    //   ),
    // );
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
