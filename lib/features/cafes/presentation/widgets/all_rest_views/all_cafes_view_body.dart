import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cafes/presentation/cubit/cafe_cubit.dart';

import 'all_cafes_view_builder.dart';

class AllCafesViewBody extends StatefulWidget {
  const AllCafesViewBody({super.key});

  @override
  State<AllCafesViewBody> createState() => _AllCafesViewBodyState();
}

class _AllCafesViewBodyState extends State<AllCafesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CafeCubit>().getCafes();
  }

  @override
  Widget build(BuildContext context) {
    return AllCafesViewBuilder();
  }
}
