import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/restaurants/presentation/cubit/restaurant_cubit.dart';

import 'all_rests_view_builder.dart';

class AllRestsViewBody extends StatefulWidget {
  const AllRestsViewBody({super.key});

  @override
  State<AllRestsViewBody> createState() => _AllRestsViewBodyState();
}

class _AllRestsViewBodyState extends State<AllRestsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<RestaurantCubit>().getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return AllRestsViewBuilder();
  }
}
