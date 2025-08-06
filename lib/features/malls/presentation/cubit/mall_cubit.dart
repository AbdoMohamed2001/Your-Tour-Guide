import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repos/mall_repo.dart';
import '../../domain/entities/mall_entity.dart';

part 'mall_state.dart';

class MallCubit extends Cubit<MallState> {
  MallCubit(this.mallRepo) : super(MallInitial());

  final MallRepo mallRepo;
  List<MallEntity> allmalls = [];

  void getMalls({String? cityName}) async {
    emit(MallsGetLoading());

    var result = await mallRepo.getMalls(cityName: cityName);
    result.fold(
      (fail) {
        emit(MallsGetFailure(fail.message));
      },
      (rests) {
        allmalls = rests;
        emit(MallsGetSuccess(allmalls));
      },
    );
  }
}
