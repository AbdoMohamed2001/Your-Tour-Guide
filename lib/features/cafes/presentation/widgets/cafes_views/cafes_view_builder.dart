import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';
import 'package:your_tour_guide/features/cafes/presentation/cubit/cafe_cubit.dart';

import '../../../../../core/utils/widgets/local_hero/local_hero_body.dart';

class CafesViewBuilder extends StatelessWidget {
  const CafesViewBuilder({super.key, required this.tabController});
  final TabController tabController;

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
          return LocalHeroBody(
            tabController: tabController,
            entities: allCafes,
          );
        }
      },
    );
  }
}
