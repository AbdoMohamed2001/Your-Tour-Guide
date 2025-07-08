import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/mall_entity.dart';

abstract class MallRepo {
  Future<Either<Failure, List<MallEntity>>> getMalls({String? cityName});
}
