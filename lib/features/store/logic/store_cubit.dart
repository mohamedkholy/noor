import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:noor/features/store/data/repos/store_repo.dart';
import 'package:noor/features/store/logic/store_state.dart';

@Injectable()
class StoreCubit extends Cubit<StoreState> {
  final StoreRepo _storeRepo;
  StoreCubit(this._storeRepo) : super(StoreInitial());
}
