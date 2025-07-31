import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            style: TextStyles.bold22,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
        ),
      ],
    );
  }
}
