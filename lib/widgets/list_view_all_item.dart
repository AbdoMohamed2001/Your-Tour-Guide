import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/widgets/deafult_cached_network_image.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildAllItem extends StatelessWidget {
  final List<QueryDocumentSnapshot>? allDocs;
  final int index;
  final Widget pushedPage;
  final String itemNameOnFireBase;
  final String imageUrl;
  BuildAllItem({
    Key? key,
    required this.index,
    @required this.allDocs,
    required this.pushedPage,
    required this.itemNameOnFireBase,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pushedPage;
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 0.75),
                ),
              ],
            ),
            child: Stack(
              children: [
                DefaultCachedNetworkImage(imageUrl: imageUrl, imageHeight: 200),
                // Image(
                //   image: NetworkImage('${imageUrl}',
                //   ),
                //   width: double.infinity,
                //   height: 200,
                //   fit: BoxFit.cover,
                //   loadingBuilder: (context, child, loadingProgress) {
                //     if (loadingProgress == null) {
                //       return child;
                //     } else {
                //       return Center(
                //         child: Container(
                //           width: double.infinity,
                //           height: 200,
                //           child: Center(
                //             child: CircularProgressIndicator(
                //               color: Colors.orange,
                //             ),
                //           ),
                //         ),
                //       );
                //     }
                //   },
                //
                // ),
                Positioned(
                  top: 145,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: BorderedText(
                      strokeColor: Colors.black,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.butt,
                      strokeJoin: StrokeJoin.bevel,
                      child: Text(
                        textAlign: TextAlign.center,
                        '${itemNameOnFireBase}',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //Done
              ],
            ),
          ),
        ),
      ),
    );
  }
}

