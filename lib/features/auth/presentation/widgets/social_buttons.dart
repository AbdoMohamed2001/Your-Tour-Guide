import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../cubits/auth_cubit/auth_cubit.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Google
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SocialLoginButton(
            borderRadius: 10,
            width: 60,
            imageWidth: 28,
            text: '',
            mode: SocialLoginButtonMode.single,
            buttonType: SocialLoginButtonType.google,
            onPressed: () {
              authCubit.signUpUserWithSocial(context: context);
            },
          ),
        ),
        //Facebook
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SocialLoginButton(
            borderRadius: 10,
            width: 60,
            imageWidth: 28,
            text: '',
            mode: SocialLoginButtonMode.single,
            buttonType: SocialLoginButtonType.facebook,
            onPressed: () {
              authCubit.signUpUserWithFacebook(context: context);
            },
          ),
        ),
        //Twitter
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SocialLoginButton(
            borderRadius: 10,
            width: 60,
            imageWidth: 28,
            text: '',
            mode: SocialLoginButtonMode.single,
            buttonType: SocialLoginButtonType.twitter,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
