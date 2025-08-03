import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';
import 'package:your_tour_guide/features/restaurants/presentation/cubit/restaurant_cubit.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../../data/repos/restaurant_repo.dart';
import '../widgets/resturant_details_view/restaurant_details_view_body.dart';

class RestaurantDetailsView extends StatelessWidget {
  RestaurantDetailsView({
    Key? key,
    required this.restEntity,
  }) : super(key: key);
  static final String id = 'RestaurantDetailsView';
  final RestaurantEntity restEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RestaurantCubit(getIt<RestaurantRepo>()),
        child: RestaurantDetailsViewBody(restEntity: restEntity),
      ),
    );
  }
}
