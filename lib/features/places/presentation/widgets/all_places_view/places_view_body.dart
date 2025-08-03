import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/places/presentation/cubit/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/all_places_view/places_list_view_builder.dart';

class PlacesViewBody extends StatefulWidget {
  const PlacesViewBody({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<PlacesViewBody> createState() => _PlacesViewBodyState();
}

class _PlacesViewBodyState extends State<PlacesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<PlaceCubit>().getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return PlacesViewListViewBuilder(
      tabController: widget.tabController,
    );
  }
}
