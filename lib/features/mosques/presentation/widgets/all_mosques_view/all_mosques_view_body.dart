import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/mosques/presentation/cubit/mosque_cubit.dart';

import 'all_mosques_view_builder.dart';

class MosquesViewBody extends StatefulWidget {
  const MosquesViewBody(
      {super.key, required this.tabController, this.cityName});
  final TabController tabController;
  final String? cityName;
  @override
  State<MosquesViewBody> createState() => _MosquesViewBodyState();
}

class _MosquesViewBodyState extends State<MosquesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<MosqueCubit>().getMosques(cityName: widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return MosquesViewBuilder(tabController: widget.tabController);
  }
}
