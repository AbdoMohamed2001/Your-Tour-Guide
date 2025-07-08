import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../data/models/mall_model.dart';
import '../../data/repos/mall_repo.dart';
import '../entities/mall_entity.dart';

class MallRepoImpl extends MallRepo {
  final DatabaseServices databaseServices;

  MallRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<MallEntity>>> getMalls({String? cityName}) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.mallsCollection,
        whereFieldValue: cityName,
        query: {
          'where': 'cityName',
        },
      ) as List<Map<String, dynamic>>;
      List<MallModel> mallModels =
          data.map((e) => MallModel.fromJson(e)).toList();
      List<MallEntity> malls =
          mallModels.map((model) => model.toEntity()).toList();
      return right(malls);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllMalls in Mall repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
