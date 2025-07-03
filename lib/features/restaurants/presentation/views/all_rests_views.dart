import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/restaurants/data/repos/restaurant_repo.dart';
import 'package:your_tour_guide/features/restaurants/presentation/cubit/restaurant_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/all_rest_views/all_rests_view_body.dart';

class AllRestsView extends StatelessWidget {
  static String id = 'AllRestsView';
  final String cityName;

  AllRestsView({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllRestaurants,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => RestaurantCubit(getIt<RestaurantRepo>()),
        child: AllRestsViewBody(),
      ),
    );
  }
}
