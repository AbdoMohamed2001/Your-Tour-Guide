import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/repos/cinema_repo.dart';
import '../../domain/entities/cinema_entity.dart';

part 'cinema_state.dart';

class CinemaCubit extends Cubit<CinemaState> {
  CinemaCubit(this.cinemaRepo) : super(CinemaInitial());

  final CinemaRepo cinemaRepo;
  List<CinemaEntity> allCinemas = [];

  void getCinemas({String? cityName}) async {
    emit(CinemasGetLoading());

    var result = await cinemaRepo.getCinemas(cityName: cityName);
    result.fold(
      (fail) {
        emit(CinemasGetFailure(fail.message));
      },
      (rests) {
        allCinemas = rests;
        emit(CinemasGetSuccess(allCinemas));
      },
    );
  }
}
