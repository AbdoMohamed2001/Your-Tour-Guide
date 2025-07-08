import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/malls/data/repos/mall_repo.dart';
import 'package:your_tour_guide/features/malls/presentation/cubit/mall_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/all_malls_view/all_malls_view_body.dart';

class AllMallsView extends StatelessWidget {
  static String id = 'AllmallsView';
  final String cityName;

  AllMallsView({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllMalls,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => MallCubit(getIt<MallRepo>()),
        child: AllMallsViewBody(),
      ),
    );
  }
}
