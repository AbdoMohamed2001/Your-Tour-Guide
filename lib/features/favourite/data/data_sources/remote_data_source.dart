import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/favourite/data/models/favourite_model.dart';
import 'package:your_tour_guide/features/favourite/domain/entities/favourite_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../../../core/utils/functions/get_user_id.dart';
import '../../../cafes/data/models/cafe_model.dart';
import '../../../churchs/data/models/church_model.dart';
import '../../../cinemas/data/models/cinema_model.dart';
import '../../../hotels/data/models/hotel_model.dart';
import '../../../malls/data/models/mall_model.dart';
import '../../../places/data/models/place_model.dart';
import '../../../restaurants/data/models/restaurant_model.dart';

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

//---------------------------------------------------------
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

//---------------------------------------------------------
  Future<List<FavouriteModel>> getFavourites() async {
    final List<Map<String, dynamic>> data = await databaseServices.getData(
      path: BackEndEndPoints.userCollection,
      recordId: getUserId(),
      subPath: 'favourites',
    );
    log('this is data');
    log(data.toString());
    List<FavouriteModel> favouriteList = [];
    for (var element in data) {
      favouriteList.add(FavouriteModel.fromJson(element));
    }
    return favouriteList;
  }

//---------------------------------------------------------
  Future<dynamic> convertToServicesEntity(FavouriteEntity fav) async {
    try {
      //Data returns as Map<String,dynamic>
      Map<String, dynamic> result = await databaseServices.getData(
          path: fav.collectionName, recordId: fav.docId);

      return convertToEntity(fav, result);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

//---------------------------------------------------------
  dynamic convertToEntity(
    FavouriteEntity favEntity,
    Map<String, dynamic> result,
  ) {
    switch (favEntity.collectionName) {
      case 'places':
        return PlaceModel.fromJson(result).toEntity();
      case 'cafes':
        return CafeModel.fromJson(result).toEntity();
      case 'churchs':
        return ChurchModel.fromJson(result).toEntity();
      case 'cinemas':
        return CinemaModel.fromJson(result).toEntity();
      case 'hotels':
        return HotelModel.fromJson(result).toEntity();
      case 'malls':
        return MallModel.fromJson(result).toEntity();
      case 'restaurants':
        return RestaurantModel.fromJson(result).toEntity();
      default:
        throw UnsupportedError(
            'Unsupported collection: ${favEntity.collectionName}');
    }
  }
}
