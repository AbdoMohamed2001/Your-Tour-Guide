import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/profile/domain/usecases/profile_usecase.dart';
import 'package:your_tour_guide/features/profile/presentation/cubit/profile_cubit.dart';

import '../../../../core/cubits/home/home_cubit.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';

class ProfileView extends StatelessWidget {
  static String id = '  ProfileView';
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).myAccount,
        leading: CustomAppBarIconButton(
          onPressed: () {
            HomeCubit.get(context).changeIndex(0);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(getIt<ProfileUseCase>()),
        child: ProfileViewBody(),
      ),
    );
  }
}
