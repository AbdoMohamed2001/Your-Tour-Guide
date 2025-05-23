import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoSingleViewPage extends StatelessWidget {
  final String imageUrl;

  const PhotoSingleViewPage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: CustomAppBarIconButton(),
      ),
      body: PhotoViewGallery.builder(
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        customSize: Size(screenWidth,screenHeight),
        itemCount: 1,
        builder: (context, index) => PhotoViewGalleryPageOptions.customChild(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => Container(
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.red.shade400,
            ),
          ),
          minScale: PhotoViewComputedScale.contained,

          heroAttributes: PhotoViewHeroAttributes(tag: imageUrl),
        ),
        pageController: PageController(initialPage: 0),
      ),
    );
  }
}
