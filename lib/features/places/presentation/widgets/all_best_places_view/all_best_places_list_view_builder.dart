import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/local_hero/local_hero_body.dart';
import 'package:your_tour_guide/features/places/domain/entities/place_entity.dart';

import '../../cubit/place_cubit/place_cubit.dart';

class BestPlacesViewListViewBuilder extends StatelessWidget {
  const BestPlacesViewListViewBuilder({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceCubit, PlaceState>(
      builder: (context, state) {
        final cubit = context.read<PlaceCubit>();
        final List<PlaceEntity> bestPlaces = cubit.bestPlaces;
        if (state is PlacesGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlacesGetFailure) {
          return const Center(child: Text('Failed to load featured places'));
        } else {
          return LocalHeroBody(
            tabController: tabController,
            entities: bestPlaces,
          );
        }
      },
    );
  }
}
