import 'package:your_tour_guide/core/utils/widgets/full_screen_image_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
    required this.entity,
    this.GridKey,
  });

  final entity;
  final Key? GridKey;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.builder(
        key: GridKey,
        padding: const EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    FullScreenImageView(photos: entity.images, index: index),
              ),
            ),
            child: Hero(
              tag: entity.images[index],
              child: CachedNetworkImage(
                imageUrl: entity.images![index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => Container(
                  color: Colors.red.shade400,
                ),
              ),
            ),
          );
        },
        itemCount: entity.images!.length,
      ),
    );
  }
}
