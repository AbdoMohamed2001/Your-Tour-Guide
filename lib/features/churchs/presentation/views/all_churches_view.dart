import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../data/repos/church_repo.dart';
import '../cubit/church_cubit.dart';
import '../widgets/all_churches_view/all_churches_view_body.dart';

class AllChurchesView extends StatelessWidget {
  static String id = 'AllChurchesView';
  final String cityName;

  AllChurchesView({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllChurches,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => ChurchCubit(getIt<ChurchRepo>()),
        child: AllChurchesViewBody(),
      ),
    );
  }
}
