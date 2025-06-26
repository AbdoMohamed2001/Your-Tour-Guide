import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/features/favourite/data/data_sources/remote_data_source.dart';

import 'package:your_tour_guide/features/favourite/data/models/favourite_model.dart';

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

  @override
  List<String> getLocalFavourites() => local.getFavourites();
  @override
  bool isFavourite(String id) => local.isFavourite(id);
}
