import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/azkar/azkar_database.dart';
import 'package:noor/features/azkar/data/repos/azkar_repo.dart';
import 'package:noor/features/azkar/logic/azkar_state.dart';

@Injectable()
class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepo azkarRepo;
  List<CategoryData> azkarCategories = [];

  AzkarCubit(this.azkarRepo) : super(AzkarInitial());

  Future<void> getAzkar(String category) async {
    final azkar = await azkarRepo.getAzkar(category);
    emit(AzkarLoaded(azkar));
  }

  Future<void> addAzkarCategoriesListener() async {
    azkarRepo.getAzkarCategories().listen((event) {
      azkarCategories = event;
      emit(AzkarCategoriesLoaded(azkarCategories));
    });
  }

  void toggleFavorite(int index) {
    azkarRepo.updateCategory(azkarCategories[index].category);
  }

  void search(String value) {
    emit(
      AzkarCategoriesLoaded(
        azkarCategories
            .where(
              (element) =>
                  element.search?.contains(value) ??
                  false || element.category.contains(value),
            )
            .toList(),
      ),
    );
  }
}
