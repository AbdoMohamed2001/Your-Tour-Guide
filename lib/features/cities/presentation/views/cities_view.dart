import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/repos/city_repo.dart';
import '../cubit/city_cubit/city_cubit.dart';
import '../widgets/cities/cities_view_body.dart';

class CitiesView extends StatelessWidget {
  const CitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).cities,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => CityCubit(getIt<CityRepo>()),
        child: CitiesViewBody(),
      ),
    );
  }
}
