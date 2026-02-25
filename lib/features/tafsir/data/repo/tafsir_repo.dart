import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/models/failure.dart';
import 'package:noor/core/networking/api_constants.dart';
import 'package:noor/core/networking/tafsir_api_service/tafsir_api_service.dart';
import 'package:noor/features/tafsir/data/models/aya_tafsir.dart';
import 'package:noor/features/tafsir/data/models/tafsir.dart';

@injectable
class TafsirRepo {
  final TafsirApiService _apiService;

  TafsirRepo(this._apiService);

  Future<Either<Failure, List<Tafsir>>> getTafsirList() async {
    try {
      final response = await _apiService.getTafsirList();
      return Right(response);
    } catch (e) {
      debugPrint(e.toString());
      if (e is DioException) {
        return Left(Failure(ApiConstants.mapDioError(e)));
      }
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, AyaTafsir>> getTafseer({
    required int tafseerId,
    required int suraNumber,
    required int ayahNumber,
  }) async {
    try {
      final response = await _apiService.getTafseer(
        tafseerId: tafseerId,
        suraNumber: suraNumber,
        ayahNumber: ayahNumber,
      );
      return Right(response);
    } catch (e) {
      debugPrint(e.toString());
      if (e is DioException) {
        return Left(Failure(ApiConstants.mapDioError(e)));
      }
      return Left(Failure(e.toString()));
    }
  }
}
