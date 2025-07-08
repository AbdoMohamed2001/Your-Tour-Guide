import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/churchs/domain/entities/church_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class ChurchRepo {
  Future<Either<Failure, List<ChurchEntity>>> getChurches({String? cityName});
}
