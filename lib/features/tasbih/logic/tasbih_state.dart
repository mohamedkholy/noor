import 'package:noor/core/database/tasbih/tasbih_database.dart';

abstract class TasbihState {}

class TasbihInitial extends TasbihState {}

class TasbihLoaded extends TasbihState {
  final List<Tasbih> tasbih;
  TasbihLoaded(this.tasbih);
}