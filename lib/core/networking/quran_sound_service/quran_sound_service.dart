import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/networking/api_constants.dart';
import 'package:noor/features/quran/data/models/ayah_sound_response/ayah_sound_response.dart';
import 'package:noor/features/quran/data/models/quran_page_sound_response/quran_page_sound_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'quran_sound_service.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.quranSoundUrl)
abstract class QuranSoundService {
  @FactoryMethod()
  factory QuranSoundService(Dio dio) = _QuranSoundService;

  @GET("ayah/{ayaPosition}/{qari}")
  Future<AyahSoundResponse> getAyaSound(
    @Path("ayaPosition") String ayaPosition,
    @Path("qari") String qari,
  );

  @GET("page/{pageNumber}/{qari}")
  Future<QuranPageSoundResponse> getPageSound(
    @Path("pageNumber") int pageNumber,
    @Path("qari") String qari,
  );
}
