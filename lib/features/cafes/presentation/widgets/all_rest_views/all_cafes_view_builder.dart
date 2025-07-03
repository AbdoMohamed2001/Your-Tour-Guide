import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';
import 'package:your_tour_guide/features/cafes/presentation/cubit/cafe_cubit.dart';

import 'cafes_list_view.dart';

class AllCafesViewBuilder extends StatelessWidget {
  const AllCafesViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CafeCubit, CafeState>(
      builder: (context, state) {
        final cubit = context.read<CafeCubit>();
        final List<CafeEntity> allCafes = cubit.allCafes;
        if (state is CafesGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CafesGetFailure) {
          return const Center(child: Text('Failed to load featured places'));
        } else {
          return CafesListView(list: allCafes);
        }
      },
    );
  }
}
