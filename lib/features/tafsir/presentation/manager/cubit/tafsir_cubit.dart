import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/features/tafsir/data/models/tafsir.dart';
import 'package:noor/features/tafsir/data/repo/tafsir_repo.dart';

part 'tafsir_state.dart';

@injectable
class TafsirCubit extends Cubit<TafsirState> {
  TafsirCubit(this.tafsirRepo) : super(TafsirInitial());

  final TafsirRepo tafsirRepo;

  void getTafsirList() async {
    emit(TafsirLoading());
    final response = await tafsirRepo.getTafsirList();
    response.fold(
      ifLeft: (failure) => emit(TafsirError(failure: failure.message)),
      ifRight: (data) {
        emit(TafsirSuccess(data: data));
      },
    );
  }
}
