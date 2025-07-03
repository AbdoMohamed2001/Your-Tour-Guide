import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/mosques/data/repos/mosque_repo.dart';
import 'package:your_tour_guide/features/mosques/presentation/cubit/mosque_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/all_mosques_view/all_mosques_view_body.dart';

class AllMosquesView extends StatelessWidget {
  static String id = 'AllMosquesView';
  final String cityName;

  AllMosquesView({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllMosques,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => MosqueCubit(getIt<MosqueRepo>()),
        child: AllMosquesViewBody(),
      ),
    );
  }
}
