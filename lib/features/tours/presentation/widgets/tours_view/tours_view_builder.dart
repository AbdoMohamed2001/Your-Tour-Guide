import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/tours/presentation/cubit/tour_cubit.dart';

import '../../../../../core/utils/widgets/custom-grid-view/grid_list_view.dart';
import '../../../domain/entities/tour_entity.dart';

class ToursViewBuilder extends StatelessWidget {
  const ToursViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourState>(
      builder: (context, state) {
        final cubit = context.read<TourCubit>();
        final List<TourEntity> tours = cubit.allTours;
        if (state is TourLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TourFailure) {
          return const Center(child: Text('Failed to load Tours'));
        } else {
          return GridListView(
            list: tours,
            isTour: true,
          );
        }
      },
    );
  }
}
