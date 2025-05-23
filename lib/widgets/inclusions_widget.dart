import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Inclusions extends StatelessWidget {
  Inclusions({
    Key? key,
    required this.icon,
    required this.index,
    required this.upcomingEvent,
    required this.exclusionsOrInclusion,
    required this.iconColor,
  }) : super(key: key);
  final IconData icon;
  final int index;
  final String exclusionsOrInclusion;
  final QueryDocumentSnapshot<Object?> upcomingEvent;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(

      padding: EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
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
            width: screenWidth*0.75,
            child: Text(upcomingEvent[exclusionsOrInclusion][index]),

          ),
        ],
      ),
    );
  }
}
