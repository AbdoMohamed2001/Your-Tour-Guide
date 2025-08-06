import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/tours/presentation/cubit/tour_cubit.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tours_view/tours_view_builder.dart';

class ToursViewBody extends StatefulWidget {
  const ToursViewBody({super.key, this.tourType, this.placeDocId});
  final String? tourType;
  final String? placeDocId;
  @override
  State<ToursViewBody> createState() => _ToursViewBodyState();
}

class _ToursViewBodyState extends State<ToursViewBody> {
  @override
  void initState() {
    super.initState();
    context
        .read<TourCubit>()
        .getTours(tourType: widget.tourType, placeDocID: widget.placeDocId);
  }

  @override
  Widget build(BuildContext context) {
    return ToursViewBuilder();
  }
}
