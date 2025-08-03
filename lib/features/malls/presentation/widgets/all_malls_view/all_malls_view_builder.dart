import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/local_hero/local_hero_body.dart';
import '../../../domain/entities/mall_entity.dart';
import '../../cubit/mall_cubit.dart';

class MallsViewBuilder extends StatelessWidget {
  const MallsViewBuilder({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallCubit, MallState>(
      builder: (context, state) {
        final cubit = context.read<MallCubit>();
        final List<MallEntity> allMalls = cubit.allmalls;
        if (state is MallsGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MallsGetFailure) {
          return const Center(child: Text('Failed to load Malls'));
        } else {
          return LocalHeroBody(
              tabController: tabController, entities: allMalls);
        }
      },
    );
  }
}
