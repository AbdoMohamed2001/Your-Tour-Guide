import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/domain/entities/place_entity.dart';

import '../../errors/failure.dart';

abstract class PlacesRepo {
  Future<Either<Failure, List<PlaceEntity>>> getPlaces();
  Future<Either<Failure, List<PlaceEntity>>> getFeaturedPlaces();
}
