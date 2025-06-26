import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';

import '../../domain/entities/city_entity.dart';

abstract class CityRepo {
  Future<Either<Failure, List<CityEntity>>> getCities();
}
