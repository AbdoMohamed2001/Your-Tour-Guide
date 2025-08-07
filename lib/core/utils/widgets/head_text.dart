import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';

class HeadText extends StatelessWidget {
  const HeadText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.bold20,
    );
  }
}
