import 'package:your_tour_guide/features/tours/domain/entities/tour_entity.dart';
import 'package:your_tour_guide/features/tours/domain/usecases/get_tours_usecase.dart';
import 'package:your_tour_guide/features/tours/presentation/cubit/tour_cubit.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tour_details_view/tour_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/get_it_services_locator.dart';

class TourDetailsView extends StatelessWidget {
  TourDetailsView({
    Key? key,
    required this.tourEntity,
  }) : super(key: key);

  final TourEntity tourEntity;
  static final String id = 'TourDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TourCubit(getIt<GetToursUseCase>()),
        child: TourDetailsViewBody(
          tourEntity: tourEntity,
        ),
      ),
    );
  }
}
