import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/features/auth/presentation/widgets/social_buttons.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/features/auth/presentation/views/forget_password.dart';
import 'package:your_tour_guide/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../views/register_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var AuthCubitClass = AuthCubit.get(context);
    return ModalProgressHUD(
      inAsyncCall: AuthCubitClass.isLoading,
      child: Form(
        key: AuthCubitClass.formKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                //Welcome
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        S.of(context).WELCOME,
                        style: const TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ],
                ),
                //---------------------------------------------------------
                //Image
                const Image(
                  image: AssetImage('assets/images/applogo.png'),
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 35,
                ),
                //---------------------------------------------------------
                //Login Now
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).LoginNowToDiscoverEgypt,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                kSizedBox,
                //-------------------------------------------------------------------
                //Email
                CustomTextField(
                  controller: AuthCubitClass.emailController,
                  labelText: S.of(context).Email,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^([a-z\d_.-]+)@([\da-z.-]+)\.([a-z.]{2,63})$')
                            .hasMatch(value)) {
                      return S.of(context).EnterCorrectEmail;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30,
                ),
                //-------------------------------------------------------------------
                //Password
                CustomTextField(
                  controller: AuthCubitClass.passController,
                  labelText: S.of(context).Password,
                  obscureText: AuthCubitClass.isPassObscure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).EnterCorrectPassword;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      AuthCubitClass.changePassIcon();
                    },
                    icon: AuthCubitClass.isPassObscure == true
                        ? const Icon(
                            Icons.visibility_rounded,
                            color: Colors.grey,
                          )
                        : const Icon(Icons.visibility_off),
                    color: Colors.grey,
                  ),
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 10,
                ),
                //-------------------------------------------------------------------
                //OR Widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 2,
                        color: Colors.orange,
                        thickness: 1,
                        endIndent: 4,
                        indent: 25,
                      ),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Expanded(
                      child: Divider(
                        height: 2,
                        color: Colors.orange,
                        thickness: 1,
                        endIndent: 25,
                        indent: 4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //-------------------------------------------------------------------
                //Social Buttons
                SocialButtons(),
                SizedBox(
                  height: 50,
                ),

                //-------------------------------------------------------------------
                //Login Button
                GestureDetector(
                  onTap: () async {
                    if (AuthCubitClass.formKey.currentState!.validate()) {
                      AuthCubitClass.isLoading = true;
                      await AuthCubitClass.loginUser(
                        context: context,
                        email: AuthCubitClass.emailController.text,
                        password: AuthCubitClass.passController.text,
                      );
                    }
                    AuthCubitClass.isLoading = false;
                    // setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: Text(
                          S.of(context).Login,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                //Or
                kSizedBox,
                //-------------------------------------------------------------------
                //Forget Password and sign up
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgetPasswordScreen();
                          }));
                        },
                        child: Text(
                          S.of(context).ForgetPassword,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return RegisterView();
                          }));
                        },
                        child: Text(
                          S.of(context).SIGNUP,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //-------------------------------------------------------------------
              ],
            ),
          ],
        ),
      ),
    );
  }
}
