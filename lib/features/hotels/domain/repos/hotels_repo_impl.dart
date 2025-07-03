import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/services/database_services.dart';
import 'package:your_tour_guide/features/hotels/data/models/hotel_model.dart';

import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';

import '../../../../core/utils/backend_endpoints.dart';
import '../../data/repos/hotels_repo.dart';

class HotelsRepoImpl extends HotelsRepo {
  final DatabaseServices databaseServices;

  HotelsRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<HotelEntity>>> getHotels(
      {String? cityName}) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.hotelsCollection,
        whereFieldValue: cityName,
        query: {
          'where': 'cityName',
        },
      ) as List<Map<String, dynamic>>;
      List<HotelModel> hotelModels =
          data.map((e) => HotelModel.fromJson(e)).toList();
      List<HotelEntity> hotels =
          hotelModels.map((model) => model.toEntity()).toList();
      return right(hotels);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllHotels in hotels repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
