import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/features/radio/data/model/radio_data.dart';
import 'package:noor/features/radio/data/model/radio_model.dart';
import 'package:noor/features/radio/data/repo/radio_repo.dart';

part 'radio_state.dart';

@injectable
class RadioCubit extends Cubit<RadioState> {
  RadioCubit(this.radioRepo) : super(RadioInitial());
  RadioRepo radioRepo;
  RadioModel? radioModel;
  // ServerFailure? serverFailure;
  List<RadioData> radioList = [];
  void getRadio() async {
    emit(RadioLoading());
    final response = await radioRepo.getRadio();
    response.fold(
      ifLeft: (failure) => emit(RadioError(failure: failure.message)),
      ifRight: (data) {
        radioModel = data;
        radioList.addAll(radioModel!.radios ?? []);
        emit(RadioSuccess(data: radioModel!));
      },
    );
  }
}
