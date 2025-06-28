import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/places/presentation/cubit/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/all_places_view/all_places_list_view_builder.dart';

class AllPlacesViewBody extends StatefulWidget {
  const AllPlacesViewBody({
    super.key,
  });

  @override
  State<AllPlacesViewBody> createState() => _AllPlacesViewBodyState();
}

class _AllPlacesViewBodyState extends State<AllPlacesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<PlaceCubit>().getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return AllPlacesViewListViewBuilder();
  }
}
