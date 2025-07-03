import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class CafeRepo {
  Future<Either<Failure, List<CafeEntity>>> getCafes({String? cityName});
}
