import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/features/favourite/domain/entities/favourite_entity.dart';

import '../models/favourite_model.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, void>> toggleFavourite(FavouriteModel model);

  List<String> getLocalFavourites();

  bool isFavourite(String id);

  Future<Either<Failure, List<FavouriteEntity>>> getFavourites();

  Future<Either<Failure, dynamic>> getEntity(FavouriteEntity favEntity);
}
