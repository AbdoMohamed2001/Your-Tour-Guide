import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/auth/domain/repos/auth_repo.dart';
import 'package:your_tour_guide/features/nav_bar/presentation/widgets/profile_view/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  static String id = '  ProfileView';
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(getIt<AuthRepo>()),
        child: ProfileViewBody(),
      ),
    );
  }
}
