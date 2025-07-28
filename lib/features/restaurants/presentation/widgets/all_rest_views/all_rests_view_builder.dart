import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/grid_list_view.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';
import 'package:your_tour_guide/features/restaurants/presentation/cubit/restaurant_cubit.dart';

class AllRestsViewBuilder extends StatelessWidget {
  const AllRestsViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        final cubit = context.read<RestaurantCubit>();
        final List<RestaurantEntity> allRestaurant = cubit.allRestaurants;
        if (state is RestaurantsGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RestaurantsGetFailure) {
          return const Center(child: Text('Failed to load Restaurants'));
        } else {
          return GridListView(list: allRestaurant);
        }
      },
    );
  }
}
