import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/tours/domain/usecases/get_tours_usecase.dart';
import 'package:your_tour_guide/features/tours/presentation/cubit/tour_cubit.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tours_view/tours_view_body.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class ToursView extends StatelessWidget {
  const ToursView({super.key, required this.tourType});
  final String tourType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllTours,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => TourCubit(getIt<GetToursUseCase>()),
        child: ToursViewBody(
          tourType: tourType,
        ),
      ),
    );
  }
}
