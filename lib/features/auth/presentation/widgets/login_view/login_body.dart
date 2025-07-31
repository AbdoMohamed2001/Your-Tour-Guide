import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/text_styles.dart';
import 'package:your_tour_guide/core/utils/widgets/combined_text.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_button.dart';
import 'package:your_tour_guide/features/auth/data/models/user_login_req_model.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/or_widget.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/social_buttons.dart';
import 'package:your_tour_guide/generated/assets.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey();
final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();
bool isPassObscure = true;

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    var AuthCubitClass = AuthCubit.get(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Skeletonizer(
      enabled: context.read<AuthCubit>().state is AuthLoading,
      child: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---------------------------------------------------------
                //Image
                Center(
                  child: const Image(
                    image: AssetImage(Assets.imagesApplogonew),
                    height: 150,
                    width: 150,
                  ),
                ),
                //Login Now
                Center(
                  child: Text(
                    S.of(context).LoginNowToDiscoverEgypt,
                    style: TextStyles.semiBold16,
                  ),
                ),
                kSizedBox,
                //Text Fields
                CustomTextField(
                  controller: emailController,
                  labelText: S.of(context).Email,
                  isObscure: false,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^([a-z\d_.-]+)@([\da-z.-]+)\.([a-z.]{2,63})$')
                            .hasMatch(value)) {
                      return S.of(context).EnterCorrectEmail;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.email_outlined),
                  textInputType: TextInputType.emailAddress,
                ),
                kSizedBox,
                CustomTextField(
                  controller: passController,
                  labelText: S.of(context).Password,
                  isObscure: isPassObscure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).EnterCorrectPassword;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.lock_outline),
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
                  textInputType: TextInputType.visiblePassword,
                ),
                kSizedBox,
                //Forget Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      S.of(context).ForgetPassword,
                      style: TextStyles.regular16,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                //-------------------------------------------------------------------
                //Login Button
                CustomButton(
                  text: S.of(context).Login,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      AuthCubitClass.loginUser(
                        userLoginInfo: UserLoginReqModel(
                          email: emailController.text,
                          password: passController.text,
                        ),
                      );
                    }
                  },
                ),
                kSizedBox,
                //-------------------------------------------------------------------
                //OR Widget
                OrWidget(),
                kSizedBox,
                //-------------------------------------------------------------------
                //Social Buttons
                SocialButtons(),
                SizedBox(height: screenHeight * 0.08),
                //-------------------------------------------------------------------
                CombinedText(
                    firstText: "Don't have an account? ",
                    secondText: S.of(context).SIGNUP),
                //-------------------------------------------------------------------
              ],
            ),
          ],
        ),
      ),
    );
  }
}
