import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'custom_app_bar.dart';

class FullScreenImageView extends StatelessWidget {
  final List<dynamic> photos;
  final int index;

  const FullScreenImageView({
    Key? key,
    required this.photos,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomAppBarIconButton(),
      ),
      body: PhotoViewGallery.builder(
        backgroundDecoration: BoxDecoration(),
        scrollPhysics: ClampingScrollPhysics(),
        itemCount: photos.length,
        pageController: PageController(initialPage: index),
        customSize: Size(800, 800),
        loadingBuilder: (context, event) => Center(
          child: CircularProgressIndicator(),
        ),
        builder: (context, index) => PhotoViewGalleryPageOptions(
          imageProvider: CachedNetworkImageProvider(
            photos[index],
          ),
          initialScale: PhotoViewComputedScale.contained,

          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2.0,
          // child: CachedNetworkImage(
          //   imageUrl: photos[index],
          //   placeholder: (context, url) => Container(
          //     color: Colors.grey,
          //   ),
          //   errorWidget: (context, url, error) => Container(
          //     color: Colors.red.shade400,
          //   ),
          // ),
          // minScale: PhotoViewComputedScale.covered,
          heroAttributes: PhotoViewHeroAttributes(tag: photos[index]),
        ),
      ),
    );
  }
}
