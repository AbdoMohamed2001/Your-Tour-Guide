import 'package:your_tour_guide/widgets/home/home_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeNavBarView extends StatelessWidget {
  final int currentIndex;
  static String id = 'HomeNavBarView';
  final String? documentId;

  HomeNavBarView({
    Key? key,
    this.documentId,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference bestplaces = FirebaseFirestore.instance
        .collection('places'); //S.of(context).placesCollection
    return Scaffold(
      body: HomeBody(bestplaces: bestplaces),
    );
  }
}
