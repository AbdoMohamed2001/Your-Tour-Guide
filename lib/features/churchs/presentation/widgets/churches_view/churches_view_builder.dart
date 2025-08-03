import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/local_hero/local_hero_body.dart';
import '../../../domain/entities/church_entity.dart';
import '../../cubit/church_cubit.dart';

class ChurchesViewBuilder extends StatelessWidget {
  const ChurchesViewBuilder({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChurchCubit, ChurchState>(
      builder: (context, state) {
        final cubit = context.read<ChurchCubit>();
        final List<ChurchEntity> allChurches = cubit.allChurchs;
        if (state is ChurchsGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChurchsGetFailure) {
          return const Center(child: Text('Failed to load Churches'));
        } else {
          return LocalHeroBody(
            tabController: tabController,
            entities: allChurches,
          );
        }
      },
    );
  }
}
