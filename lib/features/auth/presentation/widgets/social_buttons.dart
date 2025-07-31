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

        SocialLoginButton(
          borderRadius: 20,
          text: '',
          buttonType: SocialLoginButtonType.google,
          mode: SocialLoginButtonMode.single,
          onPressed: () {
            authCubit.loginWithGoogle();
          },
        ),
        //Facebook
        SocialLoginButton(
          borderRadius: 20,
          text: '',
          mode: SocialLoginButtonMode.single,
          buttonType: SocialLoginButtonType.facebook,
          onPressed: () {
            authCubit.loginWithFacebook();
          },
        ),
        //Twitter
        SocialLoginButton(
          borderRadius: 20,
          text: '',
          mode: SocialLoginButtonMode.single,
          buttonType: SocialLoginButtonType.twitter,
          onPressed: () {},
        ),
      ],
    );
  }
}
