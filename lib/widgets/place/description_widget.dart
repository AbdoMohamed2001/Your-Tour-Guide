import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../constants.dart';
import '../head_text.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.model,
  });

  final model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadText(
                 text: S.of(context).Description,
              ),
            ],
          ),
        ),
        kSizedBox,
        // Text in description
        ReadMoreText(
          isArabic() ? model.descriptionArabic! : model.description!,
          trimLines: 3,
          lessStyle: TextStyle(
            color: Colors.orange,
          ),
          moreStyle: TextStyle(
            color: Colors.orange,
          ),


        ),

        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            height: 130,
            child: SingleChildScrollView(
              clipBehavior: Clip.hardEdge,
              controller: ScrollController(),
              child: Center(
                child: Text(
                  isArabic() ? model.descriptionArabic! : model.description!,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

