import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/screens/all_screen.dart';
import 'package:your_tour_guide/screens/places/all_places.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:flutter/material.dart';

class ExplorePlacesWidget extends StatelessWidget {
  const ExplorePlacesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // HeadText(text: 'TravelPlaces'),
        HeadText(text: S.of(context).TravelPlaces),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllScreen(
                      collectionName: 'places',
                      appBarText: S.of(context).AllPlaces, cityName: '',),
                ));
          },
          child: Container(
            width: 90,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius:
              const BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
                child: Text(
                  // 'ViewAll',
                  S.of(context).ViewAll,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
