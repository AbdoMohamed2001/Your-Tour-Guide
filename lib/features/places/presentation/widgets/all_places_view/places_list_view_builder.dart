import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/local_hero/local_hero_body.dart';
import 'package:your_tour_guide/features/places/domian/entities/place_entity.dart';

import '../../cubit/place_cubit/place_cubit.dart';

class PlacesViewListViewBuilder extends StatelessWidget {
  const PlacesViewListViewBuilder({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceCubit, PlaceState>(
      builder: (context, state) {
        final cubit = context.read<PlaceCubit>();
        final List<PlaceEntity> allPlaces = cubit.allPlaces;
        if (state is PlacesGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlacesGetFailure) {
          return const Center(child: Text('Failed to load featured places'));
        } else {
          return LocalHeroBody(
            tabController: tabController,
            entities: allPlaces,
          );
          // return GridListView(list: allPlaces);
        }
      },
    );
  }
}

enum FavoriteShapeEnum { grid, list }
