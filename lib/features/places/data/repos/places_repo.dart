import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/places/domain/entities/place_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class PlacesRepo {
  Future<Either<Failure, List<PlaceEntity>>> getPlaces({String? cityName});
  Future<Either<Failure, List<PlaceEntity>>> getFeaturedPlaces();
}
