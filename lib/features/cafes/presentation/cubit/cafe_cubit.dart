import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repos/cafe_repo.dart';
import '../../domain/entities/cafe_entity.dart';

part 'cafe_state.dart';

class CafeCubit extends Cubit<CafeState> {
  CafeCubit(this.cafeRepo) : super(CafeInitial());

  final CafeRepo cafeRepo;
  List<CafeEntity> allCafes = [];

  void getCafes({String? cityName}) async {
    emit(CafesGetLoading());

    var result = await cafeRepo.getCafes(cityName: cityName);
    result.fold(
      (fail) {
        emit(CafesGetFailure(fail.message));
      },
      (rests) {
        allCafes = rests;
        emit(CafesGetSuccess(allCafes));
      },
    );
  }
}
