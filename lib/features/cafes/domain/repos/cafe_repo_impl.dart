import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/services/database_services.dart';
import 'package:your_tour_guide/features/cafes/data/models/cafe_model.dart';
import 'package:your_tour_guide/features/cafes/data/repos/cafe_repo.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';

import '../../../../core/utils/backend_endpoints.dart';

class CafeRepoImpl extends CafeRepo {
  final DatabaseServices databaseServices;

  CafeRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<CafeEntity>>> getCafes({String? cityName}) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.cafesCollection,
        whereFieldValue: cityName,
        query: {
          'where': 'cityName',
        },
      ) as List<Map<String, dynamic>>;
      List<CafeModel> cafeModels =
          data.map((e) => CafeModel.fromJson(e)).toList();
      List<CafeEntity> cafes =
          cafeModels.map((model) => model.toEntity()).toList();
      return right(cafes);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllCafes in cafes repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
