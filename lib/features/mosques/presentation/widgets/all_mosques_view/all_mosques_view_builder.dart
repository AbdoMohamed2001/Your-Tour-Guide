import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/mosques/domain/entities/mosque_entity.dart';
import 'package:your_tour_guide/features/mosques/presentation/cubit/mosque_cubit.dart';
import 'package:your_tour_guide/features/mosques/presentation/widgets/all_mosques_view/mosques_list_view.dart';

class AllMosquesViewBuilder extends StatelessWidget {
  const AllMosquesViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MosqueCubit, MosqueState>(
      builder: (context, state) {
        final cubit = context.read<MosqueCubit>();
        final List<MosqueEntity> allMosques = cubit.allMosques;
        if (state is MosquesGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MosquesGetFailure) {
          return const Center(child: Text('Failed to load Mosques'));
        } else {
          return MosquesListView(list: allMosques);
        }
      },
    );
  }
}
