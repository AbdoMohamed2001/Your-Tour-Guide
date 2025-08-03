import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/restaurants/presentation/cubit/restaurant_cubit.dart';

import 'restaurants_view_builder.dart';

class RestaurantsViewBody extends StatefulWidget {
  const RestaurantsViewBody({super.key, required this.tabController});
  final TabController tabController;
  @override
  State<RestaurantsViewBody> createState() => _RestaurantsViewBodyState();
}

class _RestaurantsViewBodyState extends State<RestaurantsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<RestaurantCubit>().getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return RestaurantsViewBuilder(tabController: widget.tabController);
  }
}
