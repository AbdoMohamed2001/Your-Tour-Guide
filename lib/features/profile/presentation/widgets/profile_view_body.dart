import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:your_tour_guide/core/utils/app_colors.dart';
import 'package:your_tour_guide/core/utils/functions/show_snack_bar.dart';
import 'package:your_tour_guide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:your_tour_guide/features/splash/presentation/views/welcome_view.dart';
import '../../../../constants.dart';
import '../../../../core/utils/text_styles.dart';
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
                    // SizedBox(height: deviceHeight * 0.01),
                    // AppBar(
                    //   title: Text(
                    //     S.of(context).myAccount,
                    //     style: TextStyles.bold18,
                    //   ),
                    //   centerTitle: true,
                    //   automaticallyImplyLeading: false,
                    // ),
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
                    SizedBox(height: deviceHeight * 0.03),
                    Divider(
                      height: 1,
                      color: Color(0xffF2F3F3),
                    ),
                    SizedBox(height: deviceHeight * 0.024),
                    // Help
                    // Text(
                    //   S.of(context).help,
                    //   style: TextStyles.regular14,
                    // ),
                    SizedBox(height: deviceHeight * 0.065),
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
                      S.of(context).SignOut,
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
