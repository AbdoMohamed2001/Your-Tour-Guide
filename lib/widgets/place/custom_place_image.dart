import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/utils.dart';
import '../deafult_cached_network_image.dart';

class CustomPlaceImage extends StatelessWidget {
  const CustomPlaceImage({
    super.key,
    required this.docID,
    required this.imageUrl,
    required this.name,
    required this.cityName,
    required this.containerImage,
    required this.cubitLikedValue,
    required this.favouriteFunction,
    required this.cubitDataKeyCurrentContext,
    required this.images,
     this.fontSize=22,
  });

  final docID;
  final String? imageUrl;
  final String? name;
  final String? cityName;
  final String? containerImage;
  final bool cubitLikedValue;
  final void Function()? favouriteFunction;
  final cubitDataKeyCurrentContext;
  final List images;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10),),
      child: Stack(
        children: [
          DefaultCachedNetworkImage(
              imageUrl: imageUrl,
              imageHeight: 370,
          ),
          //Pyramids
          Positioned(
            top: 285,
            right: isArabic() ? 15 : null,
            left:  isArabic() ? null : 15,
            child: BorderedText(
              strokeColor: Colors.black,
              strokeWidth: 2,
              strokeCap: StrokeCap.butt,
              strokeJoin: StrokeJoin.bevel,
              child: Text(
                name!.replaceAll('_b', '\n'),
                maxLines: 2,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ), //Done
          //Giza
          Positioned(
            top: 320,
            right: isArabic() ? 15 : null,
            left:  isArabic() ? null : 15,
            child: BorderedText(
              strokeColor: Colors.black,
              strokeWidth: 2,
              strokeCap: StrokeCap.butt,
              strokeJoin: StrokeJoin.bevel,
              child: Text(
                cityName!,
                // place['cityName'],
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ), //Done
          //End Image
          images.isEmpty ? Container()
              :Positioned(
            top: 310,
            right: isArabic() ? null : 10,
            left:  isArabic() ? 10 : null,
            child: GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                    cubitDataKeyCurrentContext!);
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
                        image: NetworkImage(
                          containerImage!,
                        ),
                      ),
                      Center(
                        child: BorderedText(
                          strokeColor: Colors.black,
                          strokeWidth: 1.5,
                          strokeCap: StrokeCap.butt,
                          strokeJoin: StrokeJoin.bevel,
                          child: Text(
                            images.isEmpty ? '':
                            '+${images.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //Favourite
          Positioned(
            top: 30,
            right: isArabic() ? null : 10, //25 null
            left:  isArabic() ? 10 : null, //null 0
            child: IconButton(
              onPressed: favouriteFunction,
              icon: Icon(
                Icons.favorite,
                color: cubitLikedValue == true
                    ? Colors.red
                    : HomeCubit.get(context).isDark! ? Colors.white : Colors.black,
                size: 40,
              ),
            ),
          ),
          //Back
          Positioned(
            top: 30,
            right: isArabic() ? 10 : null, //null 0
            left: isArabic() ? null : 10, //10 null


            child: IconButton(
              onPressed: () async {
                Navigator.pop(context,true);

              },
              icon:  Icon(
                isArabic()?FontAwesomeIcons.chevronRight
                :FontAwesomeIcons.chevronLeft,
                color: HomeCubit.get(context).isDark! ? Colors.white : Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




