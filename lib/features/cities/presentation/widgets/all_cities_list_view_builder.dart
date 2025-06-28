import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/places/presentation/cubit/place_cubit/place_cubit.dart';
import '../../domain/entities/city_entity.dart';
import '../cubit/city_cubit/city_cubit.dart';
import 'cities_list_view.dart';

class AllCitiesListViewBuilder extends StatelessWidget {
  const AllCitiesListViewBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
      builder: (context, state) {
        final cubit = context.read<CityCubit>();
        final List<CityEntity> cities = cubit.citiesList;
        if (state is PlacesGetSuccess) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlacesGetFailure) {
          return const Center(child: Text('Failed to load featured places'));
        } else {
          return CitiesListView(list: cities);
        }
      },
    );
  }
}
