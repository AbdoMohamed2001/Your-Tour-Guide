import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/grid_list_view.dart';

import '../../../domain/entities/cinema_entity.dart';
import '../../cubit/cinema_cubit.dart';

class AllCinemasViewBuilder extends StatelessWidget {
  const AllCinemasViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CinemaCubit, CinemaState>(
      builder: (context, state) {
        final cubit = context.read<CinemaCubit>();
        final List<CinemaEntity> allCinemas = cubit.allCinemas;
        if (state is CinemasGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CinemasGetFailure) {
          return const Center(child: Text('Failed to load Cinemas'));
        } else {
          return GridListView(list: allCinemas);
        }
      },
    );
  }
}
