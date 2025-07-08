import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/mall_entity.dart';
import '../../cubit/mall_cubit.dart';
import 'malls_list_view.dart';

class AllMallsViewBuilder extends StatelessWidget {
  const AllMallsViewBuilder({super.key});

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
          return MallsListView(list: allMalls);
        }
      },
    );
  }
}
