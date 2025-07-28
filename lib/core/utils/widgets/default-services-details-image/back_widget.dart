import 'package:flutter/material.dart';

import '../../functions/is_arabic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: isArabic() ? 10 : null, //null 0
      left: isArabic() ? null : 10, //10 null

      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          isArabic()
              ? FontAwesomeIcons.chevronRight
              : FontAwesomeIcons.chevronLeft,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
