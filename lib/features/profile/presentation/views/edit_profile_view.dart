import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).EditProfile),
      body: SafeArea(
          child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
        if (state is ProfileFailure) {
          showSnackBar(context, state.failMessage);
        } else if (state is ProfileSuccess) {
          showSnackBar(context, S.of(context).changesSaved);
        }
      }, builder: (context, state) {
        return Skeletonizer(
            enabled: state is ProfileLoading, child: EditProfileViewBody());
      })),
    );
  }
}
