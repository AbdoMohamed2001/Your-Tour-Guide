import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../models/cinema_model.dart';
import '../../domain/repos/cinema_repo.dart';
import '../../domain/entities/cinema_entity.dart';

class CinemaRepoImpl extends CinemaRepo {
  final DatabaseServices databaseServices;

  CinemaRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<CinemaEntity>>> getCinemas(
      {String? cityName}) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.cinemasCollection,
        whereFieldValue: cityName,
        query: {
          'where': 'cityName',
        },
      ) as List<Map<String, dynamic>>;
      List<CinemaModel> cinemaModels =
          data.map((e) => CinemaModel.fromJson(e)).toList();
      List<CinemaEntity> cinemas =
          cinemaModels.map((model) => model.toEntity()).toList();
      return right(cinemas);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllCinemas in Cinema repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
