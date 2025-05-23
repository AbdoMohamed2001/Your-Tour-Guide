import 'package:your_tour_guide/utils/utils.dart';
import 'package:flutter/material.dart';

import '../models/tour_model.dart';

class InclusionsWidgetTour extends StatelessWidget {
  InclusionsWidgetTour({
    Key? key,
    required this.icon,
    required this.index,
    required this.tourModel,
    required this.exclusionsOrInclusion,
    required this.iconColor,
  }) : super(key: key);
  final IconData icon;
  final int index;
  final exclusionsOrInclusion;
  final TourModel tourModel;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color:
          isArabic() ? Colors.white38 :
          Colors.black12,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 25,
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: screenWidth * 0.75,
            child: Text(exclusionsOrInclusion[index]),
          ),
        ],
      ),
    );
  }
}
