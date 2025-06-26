import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  CustomImage({
    Key? key,
    required this.imageUrl,
    @required this.endImageUrl,
    required this.itemName,
    required this.itemLocation,
    required this.fontSize,
    required this.imagesLength,
    @required this.favouriteFunction,
    @required this.description,
    required this.dataKey,
  }) : super(key: key);
  final String imageUrl;
  late final String? endImageUrl;
  final String? itemName;
  final String? itemLocation;
  final String? description;
  final double fontSize;
  final String imagesLength;

  final Function()? favouriteFunction;
  final bool isFavourite = false;
  final bool isRated = false;
  final Color color = Colors.white;
  final Color isRatedColor = Colors.black;
  final GlobalKey dataKey ;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image(
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ), //Done
          //Pyramids
          Positioned(
            top: 245,
            left: 20,
            child: BorderedText(
              strokeColor: Colors.black,
              strokeWidth: 2,
              strokeCap: StrokeCap.butt,
              strokeJoin: StrokeJoin.bevel,
              child: Text(
                itemName!,
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
            top: 280,
            left: 20,
            child: BorderedText(
              strokeColor: Colors.black,
              strokeWidth: 2,
              strokeCap: StrokeCap.butt,
              strokeJoin: StrokeJoin.bevel,
              child: Text(
                itemLocation!,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                ),
              ),
            ),
          ), //Done
          //End Image
          Positioned(
            top: 290,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(dataKey.currentContext!);
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
                          endImageUrl = "$endImageUrl",
                        ),
                      ),
                      Center(
                        child: BorderedText(
                          strokeColor: Colors.black,
                          strokeWidth: 1.5,
                          strokeCap: StrokeCap.butt,
                          strokeJoin: StrokeJoin.bevel,
                          child: Text(
                            '+$imagesLength',
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
            right: 25,
            top: 10,
            child: IconButton(
              onPressed: favouriteFunction,
              icon: Icon(
                Icons.favorite,
                color: color,
                size: 40,
              ),
            ),
          ),
          //Back
          Positioned(
            left: 10,
            top: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
