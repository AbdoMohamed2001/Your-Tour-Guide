import 'package:flutter/material.dart';

class TourItinerarySeparator extends StatelessWidget {
  const TourItinerarySeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      child: Text('---->'),
    );
  }
}
