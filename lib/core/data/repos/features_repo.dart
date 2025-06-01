import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/domain/entities/feature_entity.dart';
import '../../errors/failure.dart';

abstract class FeaturesRepo {
  Future<Either<Failure, List<FeatureEntity>>> getFeature(
    String path,
    Map<String, dynamic>? query,
  );
}
