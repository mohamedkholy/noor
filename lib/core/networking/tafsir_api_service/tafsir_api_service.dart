import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/networking/api_constants.dart';
import 'package:noor/features/tafsir/data/models/aya_tafsir.dart';
import 'package:noor/features/tafsir/data/models/tafsir.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'tafsir_api_service.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.tafsirApiUrl)
abstract class TafsirApiService {
  @FactoryMethod()
  factory TafsirApiService(Dio dio) = _TafsirApiService;

  @GET("tafseer")
  Future<List<Tafsir>> getTafsirList();

  @GET("tafseer/{tafseer_id}/{sura_number}/{ayah_number}")
  Future<AyaTafsir> getTafseer({
    @Path("tafseer_id") required int tafseerId,
    @Path("sura_number") required int suraNumber,
    @Path("ayah_number") required int ayahNumber,
  });
}
