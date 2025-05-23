import 'package:flutter/material.dart';

import '../constants.dart';
import '../cubits/place_cubit/place_cubit.dart';
import '../generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SortByWidget extends StatelessWidget {
  const SortByWidget({
    super.key,
    required this.cubit,
  });
    final PlaceCubit? cubit;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var hotelCubit = cubit;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        children: [
          Text(
            S.of(context).sortBy,
            style: TextStyle(
              fontSize: screenWidth*.038,
            ),
          ),
          //Name
          GestureDetector(
            onTap: () {
              hotelCubit?.changeToName();
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth*0.175,
              height: 30,
              child: Text(S.of(context).name,
              style: TextStyle(color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: hotelCubit?.isNameSelected == true ? Colors.orange : Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth*0.03,
          ),
          //stars
          GestureDetector(
            onTap: () {
              hotelCubit?.changeToStars();
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth*0.175,
              height: 30,
              //              color: Colors.grey[300],
              child: Text(S.of(context).stars,
                style: TextStyle(color: Colors.black),

              ),
              decoration: BoxDecoration(
                color: hotelCubit?.isStarsSelected == true ? Colors.orange : Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth*0.03,
          ),
          //City
          GestureDetector(
            onTap: () {
              hotelCubit?.changeToCity();
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth*0.175,
              height: 30,
              child: Text(S.of(context).city,
              style: TextStyle(color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: hotelCubit?.isCitySelected == true ? Colors.orange : Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth*0.03,
          ),

          IconButton(
            onPressed: () {
              hotelCubit?.changeOrder();
            },
            icon:
            hotelCubit?.isDescending == false ?
            Icon(FontAwesomeIcons.arrowDown,
            size: screenWidth*.06,
            ) : Icon(FontAwesomeIcons.arrowUp),
          ),
        ],
      ),
    );
  }
}