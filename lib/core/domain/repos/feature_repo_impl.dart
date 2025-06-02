import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/data/models/feature_model.dart';
import 'package:your_tour_guide/core/data/repos/features_repo.dart';
import 'package:your_tour_guide/core/domain/entities/feature_entity.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/features/feature_details/data/models/city_model.dart';
import 'package:your_tour_guide/features/feature_details/domain/city_entity.dart';

import '../../services/database_services.dart';

class FeatureRepoImpl implements FeaturesRepo {
  final DatabaseServices databaseServices;

  FeatureRepoImpl(this.databaseServices);

  @override
  Future<Either<Failure, List<FeatureEntity>>> getFeature(
    String path,
    Map<String, dynamic>? query,
  ) async {
    try {
      var data = await databaseServices.getData(path: path, query: query)
          as List<Map<String, dynamic>>;
      List<FeatureModel> featureModels =
          data.map((e) => FeatureModel.fromJson(e)).toList();
      List<FeatureEntity> features =
          featureModels.map((model) => model.toEntity()).toList();
      //---------------------------------------------------------
      if (path == 'cities') {
        List<CityModel> citiesModel =
            data.map((e) => CityModel.fromJson(e)).toList();
        List<CityEntity> cities =
            citiesModel.map((model) => model.toCityEntity()).toList();
        log('return cities');
        return right(cities);
      }
      //---------------------------------------------------------
      return right(features);
    } catch (e) {
      log('there is error in getFeatureDetails in feature repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
