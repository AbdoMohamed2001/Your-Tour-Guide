import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/services/database_services.dart';
import 'package:your_tour_guide/features/restaurants/data/models/restaurant_model.dart';
import 'package:your_tour_guide/features/restaurants/data/repos/restaurant_repo.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';

import '../../../../core/utils/backend_endpoints.dart';

class RestaurantsRepoImpl extends RestaurantRepo {
  final DatabaseServices databaseServices;

  RestaurantsRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants(
      {String? cityName}) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.restaurantsCollection,
        whereFieldValue: cityName,
        query: {
          'where': 'cityName',
        },
      ) as List<Map<String, dynamic>>;
      List<RestaurantModel> restModels =
          data.map((e) => RestaurantModel.fromJson(e)).toList();
      List<RestaurantEntity> restaurants =
          restModels.map((model) => model.toEntity()).toList();
      return right(restaurants);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllHotels in hotels repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
