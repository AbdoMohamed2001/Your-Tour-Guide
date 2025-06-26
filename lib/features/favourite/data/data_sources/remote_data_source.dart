import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/favourite/data/models/favourite_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../../../core/utils/functions/get_user_id.dart';

class FavouriteRemoteDataSource {
  final DatabaseServices databaseServices;

  FavouriteRemoteDataSource(this.databaseServices);

  Future<Either<Failure, void>> addToFavourite(
      {required FavouriteModel favouriteModel}) async {
    try {
      await databaseServices.addData(
        path: BackEndEndPoints.userCollection,
        recordId: getUserId(),
        subPath: 'favourites',
        subRecordId: favouriteModel.docId,
        data: favouriteModel.toJson(),
      );
      return right(null);
    } catch (e) {
      log('there is error in add to favourite in favourite repo impl $e');
      return left(ServerFailure(message: 'There is error while adding data!'));
    }
  }

  Future<Either<Failure, void>> removeFromFavourite(
      {required String docId}) async {
    try {
      await databaseServices.removeData(
        path: BackEndEndPoints.userCollection,
        recordId: getUserId(),
        subPath: 'favourites',
        subRecordId: docId,
      );
      return right(null);
    } catch (e) {
      log('there is error in add to favourite in favourite repo impl $e');
      return left(ServerFailure(message: 'There is error while adding data!'));
    }
  }
}
