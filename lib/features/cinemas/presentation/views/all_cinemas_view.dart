import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cinemas/data/repos/cinema_repo.dart';
import 'package:your_tour_guide/features/cinemas/presentation/cubit/cinema_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/all_cinemas_view/all_cinemas_view_body.dart';

class AllCinemasView extends StatelessWidget {
  static String id = 'AllCinemasView';
  final String cityName;

  AllCinemasView({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllCinemas,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => CinemaCubit(getIt<CinemaRepo>()),
        child: AllCinemasViewBody(),
      ),
    );
  }
}
