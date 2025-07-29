import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/cinema_entity.dart';

abstract class CinemaRepo {
  Future<Either<Failure, List<CinemaEntity>>> getCinemas({String? cityName});
}
