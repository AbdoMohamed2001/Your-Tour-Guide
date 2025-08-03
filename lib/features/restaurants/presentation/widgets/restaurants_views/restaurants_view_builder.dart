import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';
import 'package:your_tour_guide/features/restaurants/presentation/cubit/restaurant_cubit.dart';

import '../../../../../core/utils/widgets/local_hero/local_hero_body.dart';

class RestaurantsViewBuilder extends StatelessWidget {
  const RestaurantsViewBuilder({super.key, required this.tabController});
  final TabController tabController;
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
          return LocalHeroBody(
            tabController: tabController,
            entities: allRestaurant,
          );
        }
      },
    );
  }
}
