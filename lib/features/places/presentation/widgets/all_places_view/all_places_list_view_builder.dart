import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/grid_list_view.dart';
import 'package:your_tour_guide/features/places/domian/entities/place_entity.dart';

import '../../cubit/place_cubit/place_cubit.dart';

class AllPlacesViewListViewBuilder extends StatelessWidget {
  const AllPlacesViewListViewBuilder({
    super.key,
  });
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
          return GridListView(list: allPlaces);
        }
      },
    );
  }
}
