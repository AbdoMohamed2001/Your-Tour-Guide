import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/local_hero/local_hero_body.dart';
import '../../../domain/entities/cinema_entity.dart';
import '../../cubit/cinema_cubit.dart';

class CinemasViewBuilder extends StatelessWidget {
  const CinemasViewBuilder({super.key, required this.tabController});
  final TabController tabController;
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
          return LocalHeroBody(
            tabController: tabController,
            entities: allCinemas,
          );
        }
      },
    );
  }
}
