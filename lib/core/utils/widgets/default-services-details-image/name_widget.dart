import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../../functions/is_arabic.dart';
import '../../theme/text_styles.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.entity,
  });

  final dynamic entity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 285,
      right: isArabic() ? 15 : null,
      left: isArabic() ? null : 15,
      child: BorderedText(
        strokeColor: Colors.black,
        strokeWidth: 2,
        child: Text(
          isArabic()
              ? entity.nameArabic.replaceAll('_b', '\n')
              : entity.name.replaceAll('_b', '\n'),
          maxLines: 2,
          style: TextStyles.bold22.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
