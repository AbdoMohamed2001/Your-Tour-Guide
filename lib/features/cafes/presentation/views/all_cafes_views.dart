import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cafes/data/repos/cafe_repo.dart';
import 'package:your_tour_guide/features/cafes/presentation/cubit/cafe_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../widgets/all_rest_views/all_cafes_view_body.dart';

class AllCafesView extends StatelessWidget {
  static String id = 'AllCafesView';
  final String cityName;

  AllCafesView({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllCafes,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => CafeCubit(getIt<CafeRepo>()),
        child: AllCafesViewBody(),
      ),
    );
  }
}
