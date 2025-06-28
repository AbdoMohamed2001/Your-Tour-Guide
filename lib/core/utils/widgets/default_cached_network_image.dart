import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultCachedNetworkImage extends StatelessWidget {
  const DefaultCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageHeight,
    this.imageWidth,
  });

  final String imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: imageWidth ?? double.infinity,
      height: imageHeight,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(
        child: Container(
          color: Color(0xffFFCD1),
          width: double.infinity,
          // height: imageHeight,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Container(
          color: Color(0xffFFCD1),
          width: double.infinity,
          height: imageHeight,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
