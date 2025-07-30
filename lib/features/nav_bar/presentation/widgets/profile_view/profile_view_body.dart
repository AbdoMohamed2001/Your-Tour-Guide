import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:your_tour_guide/features/splash/presentation/views/welcome_view.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../profile/presentation/widgets/profile_list_view.dart';
import '../../../../profile/presentation/widgets/profile_list_view_items.dart';
import '../../../../profile/presentation/widgets/user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => WelcomeView()));
          //
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: deviceHeight * 0.01),
            AppBar(
              title: Text(
                S.of(context).myAccount,
                style: TextStyles.bold18,
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            SizedBox(height: deviceHeight * 0.018),
            //Profile Info
            UserInfoWidget(),
            SizedBox(height: deviceHeight * 0.018),
            Text(
              S.of(context).general,
              style: TextStyles.regular14,
            ),
            SizedBox(height: deviceHeight * 0.016),
            // Profile List
            ProfileListView(
              list: profileListWithArrowIcon(context),
            ),
            ProfileListView(
              list: profileListWithoutIcon(context),
              containsArrowIcon: false,
            ),
            Divider(
              height: 1,
              color: Color(0xffF2F3F3),
            ),
            SizedBox(height: deviceHeight * 0.024),
            Text(
              S.of(context).help,
              style: TextStyles.regular14,
            ),
            SizedBox(height: deviceHeight * 0.018),
            // ProfileListItemWithArrowIcon(
            //   image: Assets.imagesInfoCircle,
            //   text: 'من نحن',
            //   pageName: 'about_us',
            // ),
            SizedBox(height: deviceHeight * 0.065),
            //SignOut
            InkWell(
              onTap: () {
                context.read<ProfileCubit>().signOut();
              },
              child: Container(
                height: 41,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange.shade300,
                  borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
