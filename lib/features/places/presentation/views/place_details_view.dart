import 'package:your_tour_guide/features/places/data/repos/places_repo.dart';
import 'package:your_tour_guide/features/places/domain/entities/place_entity.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/place_details/place_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../cubit/place_cubit/place_cubit.dart';

class PlaceDetailsView extends StatelessWidget {
  PlaceDetailsView({
    Key? key,
    required this.placeEntity,
  }) : super(key: key);

  final PlaceEntity placeEntity;
  static final String id = 'place_details';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: BlocProvider(
        create: (context) => PlaceCubit(getIt<PlacesRepo>()),
        child: PlaceDetailsViewBody(placeEntity: placeEntity),
      ),
    );
  }
}
