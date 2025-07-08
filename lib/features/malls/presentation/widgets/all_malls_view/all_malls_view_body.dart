import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/mall_cubit.dart';
import 'all_malls_view_builder.dart';

class AllMallsViewBody extends StatefulWidget {
  const AllMallsViewBody({super.key});

  @override
  State<AllMallsViewBody> createState() => _AllMallsViewBodyState();
}

class _AllMallsViewBodyState extends State<AllMallsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<MallCubit>().getMalls();
  }

  @override
  Widget build(BuildContext context) {
    return AllMallsViewBuilder();
  }
}
