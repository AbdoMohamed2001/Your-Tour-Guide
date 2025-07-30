import 'package:flutter/material.dart';

class DefaultIcon extends StatelessWidget {
  const DefaultIcon({
    super.key,
    required this.icon,
    this.radius = 22,
  });
  final Widget icon;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(0xffEEF8ED),
      child: GestureDetector(
        onTap: () {},
        child: icon,
      ),
    );
  }
}
