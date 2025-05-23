import 'package:flutter/material.dart';

import '../constants.dart';
import '../cubits/place_cubit/place_cubit.dart';
import '../generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceSortBy extends StatelessWidget {
  const PlaceSortBy({
    super.key,
    required this.cubit,
  });
  final PlaceCubit? cubit;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var servicesCubit = cubit;
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
              servicesCubit?.changeServicesToName();
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth*0.175,
              height: 30,
              child: Text(S.of(context).name),
              decoration: BoxDecoration(
                color: servicesCubit?.isServicesNameSelected == true ? Colors.orange : Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth*0.03,
          ),
          //rate
          GestureDetector(
            onTap: () {
              servicesCubit?.changeServicesToRate();
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth*0.175,
              height: 30,
              child: Text(S.of(context).rate),
              decoration: BoxDecoration(
                color: servicesCubit?.isServicesRateSelected == true ? Colors.orange : Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth*0.03,
          ),
          GestureDetector(
            onTap: () {
              servicesCubit?.changeServicesToCity();
            },
            child: Container(
              alignment: Alignment.center,
              width: screenWidth*0.175,
              height: 30,
              child: Text(S.of(context).city),
              decoration: BoxDecoration(
                color: servicesCubit?.isServiceCitySelected == true ? Colors.orange : Colors.grey,
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
              servicesCubit?.changeOrder();
            },
            icon:
            servicesCubit?.isDescending == false ?
            Icon(FontAwesomeIcons.arrowDown,
              size: screenWidth*.06,
            ) : Icon(FontAwesomeIcons.arrowUp,
              size: screenWidth*.06,
            ),
          ),
        ],
      ),
    );
  }
}