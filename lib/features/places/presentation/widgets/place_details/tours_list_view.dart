import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/place_details/tours_list_view_item.dart';

import '../../../../tours/domain/entities/tour_entity.dart';
import '../../../../tours/presentation/cubit/tour_cubit.dart';

class ToursListView extends StatefulWidget {
  const ToursListView({super.key, required this.placeDocId});

  final String placeDocId;

  @override
  State<ToursListView> createState() => _ToursListViewState();
}

class _ToursListViewState extends State<ToursListView> {
  @override
  void initState() {
    super.initState();
    context.read<TourCubit>().getTours(placeDocID: widget.placeDocId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourState>(builder: (context, state) {
      final cubit = context.read<TourCubit>();
      final List<TourEntity> tours = cubit.allTours;
      if (state is TourLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is TourFailure) {
        return const Center(child: Text('Failed to load Tours'));
      } else {
        return SizedBox(
          height: 160,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: tours.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                ToursListViewItem(tour: tours[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
          ),
        );
      }
    });
  }
}
