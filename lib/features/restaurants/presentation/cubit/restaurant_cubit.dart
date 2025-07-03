import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:your_tour_guide/features/restaurants/data/repos/restaurant_repo.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit(this.restaurantRepo) : super(RestaurantInitial());

  final RestaurantRepo restaurantRepo;
  List<RestaurantEntity> allRestaurants = [];

  void getRestaurants({String? cityName}) async {
    emit(RestaurantsGetLoading());

    var result = await restaurantRepo.getRestaurants();
    result.fold(
      (fail) {
        emit(RestaurantsGetFailure(fail.message));
      },
      (rests) {
        allRestaurants = rests;
        emit(RestaurantsGetSuccess(allRestaurants));
      },
    );
  }
}
