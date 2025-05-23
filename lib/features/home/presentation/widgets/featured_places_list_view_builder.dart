import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/domain/entities/place_entity.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/featured_places_list_view.dart';

class FeaturedPlacesListViewBuilder extends StatelessWidget {
  const FeaturedPlacesListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final List<PlaceEntity> places = cubit.featuredPlaces;
        if (state is HomeGetFeaturedPlacesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeGetFeaturedPlacesFailure) {
          return const Center(child: Text('Failed to load featured places'));
        } else {
          return FeaturedPlacesListView(places: places);
        }
      },
    );
  }
}
