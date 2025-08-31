import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/core/database/tasbih/tasbih_database.dart';
import 'package:noor/features/tasbih/data/repos/tasbih_repo.dart';
import 'package:noor/features/tasbih/logic/tasbih_state.dart';

@injectable
class TasbihCubit extends Cubit<TasbihState> {
  final TasbihRepo tasbihRepo;
  TasbihCubit(this.tasbihRepo) : super(TasbihInitial());

  void getTasbih() {
    tasbihRepo.getTasbih().listen((tasbihList) {
      if (!isClosed) {
        emit(TasbihLoaded(tasbihList));
      }
    });
  }

  void updateCount(Tasbih tasbih) async {
    tasbihRepo.updateCount(tasbih);
  }

  void deleteTasbih(Tasbih tasbih) async {
    tasbihRepo.deleteTasbih(tasbih);
  }

  Future<int> insertTasbih(Tasbih tasbih) async {
    try {
      return await tasbihRepo.insertTasbih(tasbih);
    } catch (e) {
      return -1;
    }
  }

  Future<int> updateTasbih(String oldZekr, Tasbih newTasbih) async {
    try {
      return await tasbihRepo.updateTasbih(oldZekr, newTasbih);
    } catch (e) {
      return -1;
    }
  }
}
