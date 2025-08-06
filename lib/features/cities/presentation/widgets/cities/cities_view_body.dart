import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cities/presentation/widgets/cities/cities_view_builder.dart';

import '../../cubit/city_cubit/city_cubit.dart';

class CitiesViewBody extends StatefulWidget {
  const CitiesViewBody({
    super.key,
  });

  @override
  State<CitiesViewBody> createState() => _CitiesViewBodyState();
}

class _CitiesViewBodyState extends State<CitiesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CityCubit>().getCities();
  }

  @override
  Widget build(BuildContext context) {
    return CitiesViewBuilder();
  }
}
