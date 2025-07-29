import 'package:your_tour_guide/core/utils/text_styles.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMoreWidget extends StatelessWidget {
  const ReadMoreWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: S.of(context).showMore,
      trimExpandedText: S.of(context).showLess,
      moreStyle: TextStyles.bold14.copyWith(color: Colors.orange[300]),
      lessStyle: TextStyles.bold14.copyWith(color: Colors.orange[300]),
      // style: TextStyle(
      //   color: Colors.grey.shade100,
      // ),
    );
  }
}
