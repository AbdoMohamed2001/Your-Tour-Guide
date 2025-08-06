import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/mall_cubit.dart';
import 'all_malls_view_builder.dart';

class MallsViewBody extends StatefulWidget {
  const MallsViewBody({super.key, required this.tabController, this.cityName});
  final TabController tabController;
  final String? cityName;
  @override
  State<MallsViewBody> createState() => _MallsViewBodyState();
}

class _MallsViewBodyState extends State<MallsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<MallCubit>().getMalls(cityName: widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return MallsViewBuilder(tabController: widget.tabController);
  }
}
