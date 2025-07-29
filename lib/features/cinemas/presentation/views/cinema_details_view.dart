import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cinemas/domain/repos/cinema_repo.dart';
import 'package:your_tour_guide/features/cinemas/domain/entities/cinema_entity.dart';
import 'package:your_tour_guide/features/cinemas/presentation/cubit/cinema_cubit.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../widgets/cinema_details_view/cinema_details_view_body.dart';

class CinemaDetailsView extends StatelessWidget {
  CinemaDetailsView({
    Key? key,
    required this.cinemaEntity,
  }) : super(key: key);
  static final String id = 'cinemaDetailsView';
  final CinemaEntity cinemaEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CinemaCubit(getIt<CinemaRepo>()),
        child: CinemaDetailsViewBody(cinemaEntity: cinemaEntity),
      ),
    );
  }
}
