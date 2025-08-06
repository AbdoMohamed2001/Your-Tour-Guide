import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/features/auth/data/models/user_create_req_model.dart';
import 'package:your_tour_guide/features/auth/presentation/views/login_view.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/social_buttons.dart';
import '../../../../../core/utils/theme/text_styles.dart';
import '../../../../../core/utils/widgets/combined_text.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../cubits/auth_cubit/auth_cubit.dart';
import '../or_widget.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey();
late TextEditingController emailController;
late TextEditingController nameController;

late TextEditingController passController;

late TextEditingController confirmPassController;
bool isPassObscure = true;

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passController.dispose();
    confirmPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              children: [
                //Image
                Center(
                  child: const Image(
                    image: AssetImage(Assets.imagesAppLogoNew),
                    height: 150,
                    width: 150,
                  ),
                ),
                //Login
                Center(
                  child: Text(
                    S.of(context).LoginNowToDiscoverEgypt,
                    style: TextStyles.semiBold16,
                  ),
                ),
                kSizedBox,
                //TextField
                Column(
                  children: [
                    //UserName
                    CustomTextField(
                      controller: nameController,
                      labelText: S.of(context).UserName,
                      prefixIcon: const Icon(Icons.person_outlined),
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).EnterCorrectUserName;
                        }
                        return null;
                      },
                    ),
                    kSizedBox,
                    //Email
                    CustomTextField(
                      controller: emailController,
                      labelText: S.of(context).Email,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^([a-z\d_.-]+)@([\da-z.-]+)\.([a-z.]{2,63})$')
                                .hasMatch(value)) {
                          return S.of(context).EnterCorrectEmail;
                        }
                        return null;
                      },
                      prefixIcon: const Icon(Icons.email_outlined),
                      textInputType: TextInputType.text,
                    ),
                    kSizedBox,
                    //Password
                    CustomTextField(
                      controller: passController,
                      labelText: S.of(context).Password,
                      isObscure: isPassObscure,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^.{8,}$').hasMatch(value)) {
                          return S.of(context).PasswordMustBeAtLeast8Characters;
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
                  ],
                ),
                SizedBox(height: 30),
                //Button
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().signUpUser(
                            user: UserCreateReqModel(
                              name: nameController.text,
                              email: emailController.text,
                              password: passController.text,
                            ),
                          );
                    }
                  },
                  text: S.of(context).SIGNUP,
                ),
                kSizedBox,
                //OR Widget
                OrWidget(),
                kSizedBox,
                //Social Buttons
                SocialButtons(),
                SizedBox(height: screenHeight * 0.08),
                //Text
                kSizedBox,
                CombinedText(
                  firstText: S.of(context).AlreadyHaveAccount,
                  secondText: S.of(context).SignIn.toUpperCase(),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginView(),
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
