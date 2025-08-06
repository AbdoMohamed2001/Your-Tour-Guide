import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/church_cubit.dart';
import 'churches_view_builder.dart';

class ChurchesViewBody extends StatefulWidget {
  const ChurchesViewBody(
      {super.key, required this.tabController, this.cityName});
  final TabController tabController;
  final String? cityName;

  @override
  State<ChurchesViewBody> createState() => _ChurchesViewBodyState();
}

class _ChurchesViewBodyState extends State<ChurchesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ChurchCubit>().getChurchs(cityName: widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return ChurchesViewBuilder(tabController: widget.tabController);
  }
}
