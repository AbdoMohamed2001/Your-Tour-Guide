import 'package:flutter/material.dart';

class FeatureGridContainer extends StatelessWidget {
  const FeatureGridContainer({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orangeAccent),
      ),
      width: 32,
      height: screenHeight * 0.05,
      child: Icon(icon, size: 30),
    );
  }
}
