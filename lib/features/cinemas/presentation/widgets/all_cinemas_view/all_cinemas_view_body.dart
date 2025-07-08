import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cinema_cubit.dart';
import 'all_cinemas_view_builder.dart';

class AllCinemasViewBody extends StatefulWidget {
  const AllCinemasViewBody({super.key});

  @override
  State<AllCinemasViewBody> createState() => _AllCinemasViewBodyState();
}

class _AllCinemasViewBodyState extends State<AllCinemasViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CinemaCubit>().getCinemas();
  }

  @override
  Widget build(BuildContext context) {
    return AllCinemasViewBuilder();
  }
}
