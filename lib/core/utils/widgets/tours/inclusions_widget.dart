import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';

class InclusionsWidget extends StatelessWidget {
  InclusionsWidget({
    Key? key,
    required this.eventEntity,
    this.isInclusion = true,
  }) : super(key: key);
  final dynamic eventEntity;
  final bool isInclusion;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: isInclusion
          ? eventEntity.inclusions.length
          : eventEntity.exclusions.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, i) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isInclusion
                  ? Icon(
                      Icons.done,
                      color: Colors.green,
                      size: 25,
                    )
                  : Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 25,
                    ),
              SizedBox(width: 5),
              Container(
                width: screenWidth * 0.75,
                child: isInclusion
                    ? isArabic()
                        ? Text(eventEntity.inclusions[i])
                        : Text(eventEntity.inclusions[i])
                    : isArabic()
                        ? Text(eventEntity.exclusionsArabic[i])
                        : Text(eventEntity.exclusions[i]),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, i) => SizedBox(height: 4),
    );
  }
}
