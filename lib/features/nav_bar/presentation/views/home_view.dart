import 'package:your_tour_guide/features/home/presentation/widgets/home_view_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static String id = 'HomeView';
  final String? documentId;

  HomeView({
    Key? key,
    this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
    );
  }
}
