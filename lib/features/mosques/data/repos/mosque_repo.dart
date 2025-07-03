import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/mosques/domain/entities/mosque_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class MosqueRepo {
  Future<Either<Failure, List<MosqueEntity>>> getMosques({String? cityName});
}
