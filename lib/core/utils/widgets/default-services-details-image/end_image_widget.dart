import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../functions/is_arabic.dart';
import '../../theme/text_styles.dart';
import '../full_screen_image_view.dart';

class EndImageWidget extends StatelessWidget {
  const EndImageWidget({
    super.key,
    required this.images,
  });

  final List<dynamic> images;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 310,
      right: isArabic() ? null : 10,
      left: isArabic() ? 10 : null,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullScreenImageView(
                index: 0,
                photos: images,
              ),
            ),
          );
        },
        child: Container(
          width: 55,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white,
              width: 0.8,
            ),
          ),
          child: ClipRRect(
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Image(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(images[0]),
                ),
                Center(
                  child: BorderedText(
                    strokeColor: Colors.black,
                    strokeWidth: 1.5,
                    strokeCap: StrokeCap.butt,
                    strokeJoin: StrokeJoin.bevel,
                    child: Text(
                      images.isEmpty ? '' : '+${images.length}',
                      style: TextStyles.bold16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
