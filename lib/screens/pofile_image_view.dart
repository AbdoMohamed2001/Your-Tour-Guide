import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/utils/widgets/none_app_bar.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoneAppBar(),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
