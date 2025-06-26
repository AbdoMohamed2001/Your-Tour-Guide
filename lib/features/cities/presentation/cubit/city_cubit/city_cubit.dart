import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/city_repo.dart';
import '../../../domain/entities/city_entity.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit(this.cityRepo) : super(CityInitial());
  final CityRepo cityRepo;
  List<CityEntity> citiesList = [];
  void getCities() async {
    emit(CityGetLoading());
    var result = await cityRepo.getCities();
    result.fold(
      (fail) {
        emit(CityGetFailure(fail.message));
      },
      (cities) {
        citiesList = cities;
        emit(CityGetSuccess(citiesList));
      },
    );
  }
}
