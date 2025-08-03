import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/places/presentation/cubit/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/all_best_places_view/all_best_places_list_view_builder.dart';

class BestPlacesViewBody extends StatefulWidget {
  const BestPlacesViewBody({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

  @override
  State<BestPlacesViewBody> createState() => _BestPlacesViewBodyState();
}

class _BestPlacesViewBodyState extends State<BestPlacesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<PlaceCubit>().getBestPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return BestPlacesViewListViewBuilder(tabController: widget.tabController);
  }
}
