import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/cities/data/models/city_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../data/repos/city_repo.dart';
import '../entities/city_entity.dart';

class CityRepoImpl extends CityRepo {
  final DatabaseServices databaseServices;

  CityRepoImpl(this.databaseServices);

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.citiesCollection,
      ) as List<Map<String, dynamic>>;
      List<CityModel> cityModels =
          data.map((e) => CityModel.fromJson(e)).toList();
      List<CityEntity> cities =
          cityModels.map((model) => model.toEntity()).toList();
      return right(cities);
    } catch (e, stack) {
      log('StackTrace:\n$stack');
      log('there is error in get cities in city repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
