import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cinema_cubit.dart';
import 'cinemas_view_builder.dart';

class CinemasViewBody extends StatefulWidget {
  const CinemasViewBody({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<CinemasViewBody> createState() => _CinemasViewBodyState();
}

class _CinemasViewBodyState extends State<CinemasViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CinemaCubit>().getCinemas();
  }

  @override
  Widget build(BuildContext context) {
    return CinemasViewBuilder(tabController: widget.tabController);
  }
}
