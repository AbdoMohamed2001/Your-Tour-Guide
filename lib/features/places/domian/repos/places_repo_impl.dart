import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/places/data/models/place_model.dart';

import 'package:your_tour_guide/features/places/domian/entities/place_entity.dart';

import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/services/database_services.dart';

import '../../data/repos/places_repo.dart';
import '../../../../core/utils/backend_endpoints.dart';

class PlacesRepoImpl implements PlacesRepo {
  final DatabaseServices databaseServices;

  PlacesRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<PlaceEntity>>> getFeaturedPlaces() async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.placesCollection,
        whereFieldValue: true,
        query: {
          'where': 'isBest',
          'orderBy': 'rate',
          'descending': true,
        },
      ) as List<Map<String, dynamic>>;
      List<PlaceModel> placeModels =
          data.map((e) => PlaceModel.fromJson(e)).toList();
      List<PlaceEntity> places =
          placeModels.map((model) => model.toEntity()).toList();
      return right(places);
    } catch (e) {
      log('there is error in getFeaturedPlaces in places repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }

  @override
  Future<Either<Failure, List<PlaceEntity>>> getPlaces(
      {String? cityName}) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.placesCollection,
        whereFieldValue: cityName,
        query: {
          'where': 'cityName',
        },
      ) as List<Map<String, dynamic>>;
      List<PlaceModel> placeModels =
          data.map((e) => PlaceModel.fromJson(e)).toList();
      List<PlaceEntity> places =
          placeModels.map((model) => model.toEntity()).toList();
      return right(places);
    } catch (e) {
      log('there is error in getAllPlaces in places repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
