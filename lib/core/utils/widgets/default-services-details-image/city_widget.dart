import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../../functions/is_arabic.dart';
import '../../text_styles.dart';

class CityWidget extends StatelessWidget {
  const CityWidget({
    super.key,
    required this.entity,
  });

  final dynamic entity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 320,
      right: isArabic() ? 15 : null,
      left: isArabic() ? null : 15,
      child: BorderedText(
        strokeColor: Colors.black,
        strokeWidth: 2,
        child: Text(
          isArabic() ? entity.cityNameArabic : entity.cityName,
          style: TextStyles.regular22.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
