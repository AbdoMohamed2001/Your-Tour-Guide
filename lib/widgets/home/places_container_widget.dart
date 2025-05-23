import 'package:your_tour_guide/widgets/home/build_travel_place_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlacesContainerWidget extends StatelessWidget {
  const PlacesContainerWidget({
    super.key,
    required this.allDocs,

  });

  final List<QueryDocumentSnapshot<Object?>>? allDocs;


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 190,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            BuildTravelPlacesItem(
              allDocs: allDocs,
              index: index,
            ),
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
        ),
        itemCount: 5,
      ),
    );
  }
}
