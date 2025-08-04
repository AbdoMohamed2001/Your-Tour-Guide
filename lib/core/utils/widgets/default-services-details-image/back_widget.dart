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
      top: 50,
      right: isArabic() ? 16 : null, //null 0
      left: isArabic() ? null : 16, //10 null

      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).cardColor,
          child: Padding(
            padding: isArabic()
                ? const EdgeInsets.only(left: 2.0)
                : const EdgeInsets.only(right: 2.0),
            child: Icon(
              isArabic()
                  ? FontAwesomeIcons.chevronRight
                  : FontAwesomeIcons.chevronLeft,
              color: Theme.of(context).primaryColorDark,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
