import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/networking/api_constants.dart';
import 'package:noor/core/networking/quran_sound_service/models/quran_sound_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'quran_sound_service.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.quranSoundUrl)
abstract class QuranSoundService {
  
  @FactoryMethod()
  factory QuranSoundService(Dio dio) = _QuranSoundService;

  @GET("recitations/1/by_ayah/{ayaPosition}")
  Future<QuranSoundResponse> getAyaSound(@Path("ayaPosition") int ayaPosition);

  @GET("recitations/1/by_page/{pageNumber}")
  Future<QuranSoundResponse> getPageSound(@Path("pageNumber") int pageNumber);
}
