import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/features/favourite/data/data_sources/remote_data_source.dart';

import 'package:your_tour_guide/features/favourite/data/models/favourite_model.dart';
import 'package:your_tour_guide/features/favourite/domain/entities/favourite_entity.dart';

import '../../data/data_sources/local_data_source.dart';
import '../../data/repos/favourite_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final FavouriteRemoteDataSource remote;
  final FavouriteLocalDataSource local;

  FavouriteRepoImpl(this.remote, this.local);

  @override
  Future<Either<Failure, void>> toggleFavourite(FavouriteModel model) async {
    final isFav = local.isFavourite(model.docId);
    try {
      if (isFav) {
        await remote.removeFromFavourite(docId: model.docId); // implement this
        await local.removeFavourite(model.docId);
      } else {
        await remote.addToFavourite(favouriteModel: model);
        await local.saveFavourite(model.docId);
      }
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to toggle favorite'));
    }
  }

//-------------------------------------------------------------------------------
  @override
  List<String> getLocalFavourites() => local.getFavourites();

  @override
  bool isFavourite(String id) => local.isFavourite(id);

//-------------------------------------------------------------------------------
  @override
  Future<Either<Failure, List<FavouriteEntity>>> getFavourites() async {
    try {
      var result = await remote.getFavourites();
      List<FavouriteEntity> favList =
          result.map((model) => model.toEntity()).toList();
      return right(favList);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to get favourites'));
    }
  }

//-------------------------------------------------------------------------------

//-------------------------------------------------------------------------------
  @override
  Future<Either<Failure, dynamic>> getEntity(FavouriteEntity favEntity) async {
    try {
      final entity = await remote.convertToServicesEntity(favEntity);
      return Right(entity);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(
          message:
              'There is an error while trying to convert to entity in search repo impl'));
    }
  }

//-------------------------------------------------------------------------------
}
