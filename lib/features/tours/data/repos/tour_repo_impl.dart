import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/tours/data/datasources/tour_remote_data_source.dart';
import 'package:your_tour_guide/features/tours/domain/entities/tour_entity.dart';

import '../../../../core/errors/failure.dart';

import '../../domain/repos/tour_repo.dart';

class TourRepoImpl extends TourRepo {
  final TourRemoteDataSource tourRemoteDataSource;

  TourRepoImpl(this.tourRemoteDataSource);
  @override
  Future<Either<Failure, List<TourEntity>>> getTours(
      {String? tourType, String? placeDocID}) async {
    try {
      final result = await tourRemoteDataSource.getTours(
          type: tourType, placeDocID: placeDocID);
      List<TourEntity> tours = result.map((model) => model.toEntity()).toList();
      return right(tours);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in get Tours in repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
