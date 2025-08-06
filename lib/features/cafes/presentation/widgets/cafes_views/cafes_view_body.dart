import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cafes/presentation/cubit/cafe_cubit.dart';

import 'cafes_view_builder.dart';

class CafesViewBody extends StatefulWidget {
  const CafesViewBody({super.key, required this.tabController, this.cityName});
  final TabController tabController;
  final String? cityName;

  @override
  State<CafesViewBody> createState() => _CafesViewBodyState();
}

class _CafesViewBodyState extends State<CafesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CafeCubit>().getCafes(cityName: widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return CafesViewBuilder(tabController: widget.tabController);
  }
}
