import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../views/forget_password.dart';
import '../../views/register_view.dart';

class SignUpForgetPasswordWidget extends StatelessWidget {
  const SignUpForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ForgetPasswordScreen();
            }));
          },
          child: Text(
            S.of(context).ForgetPassword,
            style: TextStyle(fontSize: 16),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return RegisterView();
            }));
          },
          child: Text(
            S.of(context).SIGNUP,
            style: TextStyles.bold16,
          ),
        ),
      ],
    );
  }
}
