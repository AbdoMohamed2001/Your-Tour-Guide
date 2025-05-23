import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/screens/best_places/photo_view_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
    required this.cubit,
    required this.model,
  });

  final  cubit;
  final  model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            S.of(context).Gallery,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        kSizedBox,
        Container(
          height: 300,
          child: GridView.builder(
            key: cubit.dataKey,
            shrinkWrap: true,
            padding: const EdgeInsets.all(1),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(0.5),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PhotoViewPage(
                          photos: model.images!, index: index),
                    ),
                  ),
                  child: Hero(
                    tag: model.images![index],
                    child: CachedNetworkImage(
                      imageUrl: model.images![index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.red.shade400,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: model.images!.length,
          ),
        ),
        kSizedBox,
      ],
    );
  }
}
