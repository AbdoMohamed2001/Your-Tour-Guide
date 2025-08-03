import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/feature_details/domain/entities/feature_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class FeaturesRepo {
  Future<Either<Failure, List<FeatureEntity>>> getFeature(
    String path,
    Map<String, dynamic>? query,
  );
}
