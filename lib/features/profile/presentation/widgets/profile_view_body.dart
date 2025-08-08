import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';
import 'package:your_tour_guide/core/utils/functions/show_snack_bar.dart';
import 'package:your_tour_guide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:your_tour_guide/features/splash/presentation/views/welcome_view.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/theme/text_styles.dart';
import '../../../../generated/l10n.dart';
import 'general_list.dart';
import 'user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => WelcomeView()));
          //
        }
        if (state is ProfileFailure) {
          showSnackBar(context, state.failMessage);
        }
        if (state is ProfileImageUploadSuccess) {
          showSnackBar(context, 'Image Updated Successfully');
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is ProfileLoading,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: deviceHeight * 0.018),
                    //Profile Info
                    UserInfoWidget(),
                    SizedBox(height: deviceHeight * 0.028),
                    //General
                    Text(
                      S.of(context).general,
                      style: TextStyles.regular14,
                    ),
                    SizedBox(height: deviceHeight * 0.021),
                    // Profile List
                    GeneralList(deviceHeight: deviceHeight),
                    SizedBox(height: deviceHeight * 0.09),
                  ],
                ),
              ),
              //SignOut
              InkWell(
                onTap: () {
                  context.read<ProfileCubit>().signOut();
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withAlpha(140),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).SignOut.toUpperCase(),
                      style: TextStyles.regular14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: deviceHeight * 0.035),
            ],
          ),
        );
      },
    );
  }
}
