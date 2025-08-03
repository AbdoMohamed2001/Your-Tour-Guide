import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/mall_cubit.dart';
import 'all_malls_view_builder.dart';

class MallsViewBody extends StatefulWidget {
  const MallsViewBody({super.key, required this.tabController});
  final TabController tabController;
  @override
  State<MallsViewBody> createState() => _MallsViewBodyState();
}

class _MallsViewBodyState extends State<MallsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<MallCubit>().getMalls();
  }

  @override
  Widget build(BuildContext context) {
    return MallsViewBuilder(tabController: widget.tabController);
  }
}
