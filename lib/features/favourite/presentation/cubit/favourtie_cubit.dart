import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:your_tour_guide/features/favourite/data/repos/favourite_repo.dart';

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
            newFavourites.add(model.docId);
          }
          emit(FavouriteToggleSuccess(newFavourites));
        } else {
          emit(FavouriteToggleSuccess({model.docId}));
        }
      },
    );
  }
}
