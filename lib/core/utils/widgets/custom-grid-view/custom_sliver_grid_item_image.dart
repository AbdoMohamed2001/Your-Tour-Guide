import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/default_cached_network_image.dart';

class CustomSliverGridImage extends StatelessWidget {
  const CustomSliverGridImage({
    Key? key,
    required this.entity,
  }) : super(key: key);

  final dynamic entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: entity.imageUrl != null
          ? DefaultCachedNetworkImage(imageUrl: entity.imageUrl)
          : const Center(
              child: Icon(
                Icons.image_rounded,
                size: 40,
                color: Colors.grey,
              ),
            ),
    );
  }
}
