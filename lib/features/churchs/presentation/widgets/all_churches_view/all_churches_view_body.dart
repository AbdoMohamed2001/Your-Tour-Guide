import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/church_cubit.dart';
import 'all_churches_view_builder.dart';

class AllChurchesViewBody extends StatefulWidget {
  const AllChurchesViewBody({super.key});

  @override
  State<AllChurchesViewBody> createState() => _AllChurchesViewBodyState();
}

class _AllChurchesViewBodyState extends State<AllChurchesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ChurchCubit>().getChurchs();
  }

  @override
  Widget build(BuildContext context) {
    return AllChurchesViewBuilder();
  }
}
