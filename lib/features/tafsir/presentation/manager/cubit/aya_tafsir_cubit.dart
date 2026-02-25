import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/features/tafsir/data/models/aya_tafsir.dart';
import 'package:noor/features/tafsir/data/repo/tafsir_repo.dart';

part 'aya_tafsir_state.dart';

@injectable
class AyaTafsirCubit extends Cubit<AyaTafsirState> {
  AyaTafsirCubit(this.tafsirRepo) : super(AyaTafsirInitial());

  final TafsirRepo tafsirRepo;

  void getAyaTafsir({
    required int tafseerId,
    required int suraNumber,
    required int ayahNumber,
  }) async {
    emit(AyaTafsirLoading());
    final response = await tafsirRepo.getTafseer(
      tafseerId: tafseerId,
      suraNumber: suraNumber,
      ayahNumber: ayahNumber,
    );
    response.fold(
      ifLeft: (failure) => emit(AyaTafsirError(failure: failure.message)),
      ifRight: (data) => emit(AyaTafsirSuccess(data: data)),
    );
  }
}
