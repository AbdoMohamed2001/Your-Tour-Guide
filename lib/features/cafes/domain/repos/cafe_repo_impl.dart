import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/features/cafes/data/datasources/cafes_remote_data_source.dart';
import 'package:your_tour_guide/features/cafes/data/repos/cafe_repo.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';

class CafeRepoImpl extends CafeRepo {
  final CafesRemoteDataSource cafesRemoteDataSource;
  CafeRepoImpl(this.cafesRemoteDataSource);
  @override
  Future<Either<Failure, List<CafeEntity>>> getCafes({String? cityName}) async {
    try {
      var models = await cafesRemoteDataSource.getCafes(cityName: cityName);
      List<CafeEntity> cafes = models.map((model) => model.toEntity()).toList();
      return right(cafes);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllCafes in cafes repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
