import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/all_best_places_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/repos/places_repo.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../generated/l10n.dart';

class AllBestPlacesView extends StatelessWidget {
  const AllBestPlacesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllBestPlaces,
      ),
      body: BlocProvider(
        create: (context) => PlaceCubit(getIt<PlacesRepo>()),
        child: AllBestPlacesViewBody(),
      ),
    );
  }
}
