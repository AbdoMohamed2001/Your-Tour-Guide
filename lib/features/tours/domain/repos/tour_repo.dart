import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/tours/domain/entities/tour_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class TourRepo {
  Future<Either<Failure, List<TourEntity>>> getTours({String? tourType});
}
