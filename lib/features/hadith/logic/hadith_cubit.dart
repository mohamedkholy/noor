import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/hadith/hadith_database.dart';
import 'package:noor/features/hadith/data/models/kitab.dart';
import 'package:noor/features/hadith/data/repos/hadith_repo.dart';
import 'package:noor/features/hadith/logic/hadith_state.dart';

@Injectable()
class HadithCubit extends Cubit<HadithState> {
  final HadithRepo hadithRepo;
  final List<Hadith> _hadiths = [];

  HadithCubit(this.hadithRepo) : super(HadithInitial());

  Future<void> getKitab(Kitab kitab, int page) async {
    final result = await hadithRepo.getKitab(kitab, page);
    _hadiths.addAll(result);
    emit(HadithLoaded(hadiths: _hadiths));
  }

  Future<void> search(Kitab kitab, int page, String value) async {
    if (page == 0) {
      _hadiths.clear(); 
    }
    final result = await hadithRepo.search(kitab, page, value);
    _hadiths.addAll(result);
    emit(HadithLoaded(hadiths: _hadiths));
  }

  void clearList() {
    _hadiths.clear();
    emit(HadithLoaded(hadiths: _hadiths));
  }
}
