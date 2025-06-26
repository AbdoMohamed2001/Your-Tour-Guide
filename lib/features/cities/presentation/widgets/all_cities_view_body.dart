import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cities/presentation/widgets/all_cities_list_view_builder.dart';

import '../cubit/city_cubit/city_cubit.dart';

class AllCitiesViewBody extends StatefulWidget {
  const AllCitiesViewBody({
    super.key,
  });

  @override
  State<AllCitiesViewBody> createState() => _AllCitiesViewBodyState();
}

class _AllCitiesViewBodyState extends State<AllCitiesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CityCubit>().getCities();
  }

  @override
  Widget build(BuildContext context) {
    return AllCitiesListViewBuilder();
  }
}
