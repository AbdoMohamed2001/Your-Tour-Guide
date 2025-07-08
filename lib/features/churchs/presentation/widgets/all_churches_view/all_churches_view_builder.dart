import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/church_entity.dart';
import '../../cubit/church_cubit.dart';
import 'churches_list_view.dart';

class AllChurchesViewBuilder extends StatelessWidget {
  const AllChurchesViewBuilder({super.key});

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
          return ChurchesListView(list: allChurches);
        }
      },
    );
  }
}
