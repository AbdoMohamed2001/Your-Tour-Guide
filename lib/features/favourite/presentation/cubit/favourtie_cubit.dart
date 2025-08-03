import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:your_tour_guide/features/favourite/data/repos/favourite_repo.dart';
import 'package:your_tour_guide/features/favourite/domain/entities/favourite_entity.dart';

import '../../data/models/favourite_model.dart';

part 'favourtie_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.favouriteRepo) : super(FavouriteInitial());
  final FavouriteRepo favouriteRepo;

  void loadLocalFavourites() {
    final favs = favouriteRepo.getLocalFavourites().toSet();
    emit(FavouriteToggleSuccess(favs));
  }

  void toggle(FavouriteModel model) async {
    final result = await favouriteRepo.toggleFavourite(model);
    result.fold(
      (failure) => emit(FavouriteToggleFailure(failure.message)),
      (success) {
        final current = state;
        if (current is FavouriteToggleSuccess) {
          final newFavourites = Set<String>.from(current.favourites);
          if (newFavourites.contains(model.docId)) {
            newFavourites.remove(model.docId);
          } else {
            // Add to favourites
            newFavourites.add(model.docId);
          }
          emit(FavouriteToggleSuccess(newFavourites));
        } else {
          emit(FavouriteToggleSuccess({model.docId}));
        }
      },
    );
  }

  List<FavouriteEntity> favs = [];

  Future<void> getFavourites() async {
    emit(FavouritesGetLoading());
    final result = await favouriteRepo.getFavourites();
    result.fold(
      (fail) {
        emit(FavouritesGetFailure(fail.message));
      },
      (favList) {
        favs = favList;
        emit(FavouritesGetSuccess(favs));
      },
    );
  }

  Future<void> getEntity(FavouriteEntity favEntity) async {
    emit(FavouritesGetEntityLoading());
    final result = await favouriteRepo.getEntity(favEntity);
    result.fold(
      (fail) {
        emit(FavouritesGetEntityError(fail.message));
        return null;
      },
      (entity) async {
        emit(FavouritesGetEntitySuccess(entity, favEntity.collectionName));
      },
    );
  }
}
