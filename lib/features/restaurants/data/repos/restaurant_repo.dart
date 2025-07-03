import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class RestaurantRepo {
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants(
      {String? cityName});
}
