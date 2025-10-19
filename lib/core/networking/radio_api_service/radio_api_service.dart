import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/networking/api_constants.dart';
import 'package:noor/features/radio/data/model/radio_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'radio_api_service.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.radio)
abstract class RadioApiService {
  @FactoryMethod()
  factory RadioApiService(Dio dio) = _RadioApiService;

  @GET("radio.json")
  Future<RadioModel> getRadio();
}
