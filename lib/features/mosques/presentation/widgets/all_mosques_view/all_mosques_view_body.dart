import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/mosques/presentation/cubit/mosque_cubit.dart';

import 'all_mosques_view_builder.dart';

class AllMosquesViewBody extends StatefulWidget {
  const AllMosquesViewBody({super.key});

  @override
  State<AllMosquesViewBody> createState() => _AllMosquesViewBodyState();
}

class _AllMosquesViewBodyState extends State<AllMosquesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<MosqueCubit>().getMosques();
  }

  @override
  Widget build(BuildContext context) {
    return AllMosquesViewBuilder();
  }
}
