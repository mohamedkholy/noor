import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/models/failure.dart';
import 'package:noor/core/networking/radio_api_service/radio_api_service.dart';
import 'package:noor/features/radio/data/model/radio_model.dart';

@injectable
class RadioRepo {
  final RadioApiService _apiService;

  RadioRepo(this._apiService);

  Future<Either<Failure, RadioModel>> getRadio() async {
    try {
      final response = await _apiService.getRadio();
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
