import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/repos/places_repo.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../generated/l10n.dart';
import '../cubit/place_cubit/place_cubit.dart';
import '../widgets/all_places_view/all_places_view_body.dart';

class AllPlacesView extends StatelessWidget {
  const AllPlacesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllPlaces,
      ),
      body: BlocProvider(
        create: (context) => PlaceCubit(getIt<PlacesRepo>()),
        child: AllPlacesViewBody(),
      ),
    );
  }
}
