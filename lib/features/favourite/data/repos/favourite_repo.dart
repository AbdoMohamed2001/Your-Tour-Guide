import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';

import '../models/favourite_model.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, void>> toggleFavourite(FavouriteModel model);
  List<String> getLocalFavourites();
  bool isFavourite(String id);
}
