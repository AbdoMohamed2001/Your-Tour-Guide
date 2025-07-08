import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../data/models/church_model.dart';
import '../../data/repos/church_repo.dart';
import '../entities/church_entity.dart';

class ChurchRepoImpl extends ChurchRepo {
  final DatabaseServices databaseServices;

  ChurchRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<ChurchEntity>>> getChurches(
      {String? cityName}) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.churchesCollection,
        whereFieldValue: cityName,
        query: {
          'where': 'cityName',
        },
      ) as List<Map<String, dynamic>>;
      List<ChurchModel> churchModels =
          data.map((e) => ChurchModel.fromJson(e)).toList();
      List<ChurchEntity> churchs =
          churchModels.map((model) => model.toEntity()).toList();
      return right(churchs);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllChurchs in Church repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
