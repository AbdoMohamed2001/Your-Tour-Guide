import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/functions/get_user_data.dart';
import '../../../../../../generated/assets.dart';
import '../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../core/utils/theme/text_styles.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../cubit/profile_cubit.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _PersonalUserDataViewBodyState();
}

class _PersonalUserDataViewBodyState extends State<EditProfileViewBody> {
  // String? userName, email, currentPassword, newPassword, confirmPassword;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPassObscure = true;
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28),
            Text(
              S.of(context).personalInfo,
              style: TextStyles.semiBold14,
            ),
            kSizedBox,
            //Name
            CustomTextField(
              controller: userNameController,
              onChanged: (value) {
                userNameController.text = value;
                // userName = value.trim();
              },
              labelText: getUserData().name,
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    Assets.iconsEdit,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            //Email
            CustomTextField(
              controller: emailController,
              onChanged: (value) {
                emailController.text = value;
                // userName = value.trim();
              },
              labelText: getUserData().email,
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(
                  Assets.iconsEdit,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              S.of(context).changePassword,
              style: TextStyles.semiBold14,
            ),
            SizedBox(height: 8),
            //password
            CustomTextField(
              controller: currentPasswordController,
              isObscure: isPassObscure,
              onChanged: (value) {
                currentPasswordController.text = value;
                // userName = value.trim();
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPassObscure = !isPassObscure;
                  });
                },
                icon: isPassObscure == true
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off),
              ),
              labelText: S.of(context).currentPassword,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 8),
            //newPassword
            CustomTextField(
              controller: newPasswordController,
              isObscure: isPassObscure,
              onChanged: (value) {
                newPasswordController.text = value;
                // userName = value.trim();
              },
              labelText: S.of(context).newPassword,
              textInputType: TextInputType.text,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPassObscure = !isPassObscure;
                  });
                },
                icon: isPassObscure == true
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 8),
            //confirmPassword
            CustomTextField(
              controller: confirmPasswordController,
              isObscure: isPassObscure,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPassObscure = !isPassObscure;
                  });
                },
                icon: isPassObscure == true
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off),
              ),
              onChanged: (value) {
                confirmPasswordController.text = value;
                // userName = value.trim();
              },
              labelText: S.of(context).confirmPassword,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: screenHeight * 0.26),
            CustomButton(
                onTap: () async {
                  //Update User Name
                  if (userNameController.text.isNotEmpty) {
                    context
                        .read<ProfileCubit>()
                        .updateUserName(name: userNameController.text.trim());
                  }
                  //Update Email
                  else if (emailController.text.isNotEmpty) {
                    context
                        .read<ProfileCubit>()
                        .updateEmail(email: emailController.text.trim());
                  }
                  //Update Password
                  else if (currentPasswordController.text.isNotEmpty &&
                      newPasswordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty) {
                    if (newPasswordController.text !=
                        confirmPasswordController.text) {
                      showSnackBar(context, S.of(context).passwordNotMatched);
                      return;
                    }
                    context.read<ProfileCubit>().updatePassword(
                          currentPassword: currentPasswordController.text,
                          newPassword: confirmPasswordController.text,
                        );
                  }
                },
                text: S.of(context).saveChanges),
          ],
        ),
      ),
    );
  }
}
