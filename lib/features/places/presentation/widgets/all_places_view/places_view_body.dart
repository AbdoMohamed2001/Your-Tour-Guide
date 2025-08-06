import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/places/presentation/cubit/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/all_places_view/places_list_view_builder.dart';

class PlacesViewBody extends StatefulWidget {
  const PlacesViewBody({
    super.key,
    required this.tabController,
    this.cityName,
  });

  final TabController tabController;
  final String? cityName;

  @override
  State<PlacesViewBody> createState() => _PlacesViewBodyState();
}

class _PlacesViewBodyState extends State<PlacesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<PlaceCubit>().getPlaces(cityName: widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return PlacesViewListViewBuilder(
      tabController: widget.tabController,
    );
  }
}
