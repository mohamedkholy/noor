import 'package:noor/core/database/azkar/azkar_database.dart';

abstract class AzkarState {}

class AzkarInitial extends AzkarState {}

class AzkarLoaded extends AzkarState {
  final List<AzkarData> azkar;
  AzkarLoaded(this.azkar);
}

class AzkarCategoriesLoaded extends AzkarState {
  final List<CategoryData> azkarCategories;
  AzkarCategoriesLoaded(this.azkarCategories);
}
