import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/services/database_services.dart';
import 'package:your_tour_guide/features/mosques/data/models/mosque_model.dart';
import 'package:your_tour_guide/features/mosques/data/repos/mosque_repo.dart';
import 'package:your_tour_guide/features/mosques/domain/entities/mosque_entity.dart';

import '../../../../core/utils/backend_endpoints.dart';

class MosqueRepoImpl extends MosqueRepo {
  final DatabaseServices databaseServices;

  MosqueRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<MosqueEntity>>> getMosques(
      {String? cityName}) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.mosquesCollection,
        whereFieldValue: cityName,
        query: {
          'where': 'cityName',
        },
      ) as List<Map<String, dynamic>>;
      List<MosqueModel> mosqueModels =
          data.map((e) => MosqueModel.fromJson(e)).toList();
      List<MosqueEntity> mosques =
          mosqueModels.map((model) => model.toEntity()).toList();
      return right(mosques);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllMosques in Mosque repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
