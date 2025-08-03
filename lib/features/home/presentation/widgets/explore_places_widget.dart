import 'package:your_tour_guide/features/places/presentation/views/places_view.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
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
                  builder: (context) => PlacesView(),
                ));
          },
          child: Container(
            width: 90,
            height: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
                child: Text(
              // 'ViewAll',
              S.of(context).ViewAll,
              style: TextStyle(),
            )),
          ),
        ),
      ],
    );
  }
}
