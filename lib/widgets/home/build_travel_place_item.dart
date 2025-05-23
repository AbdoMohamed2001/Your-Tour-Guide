import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/models/place_model.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

import '../../screens/places/place_screen_new.dart';
class BuildTravelPlacesItem extends StatelessWidget {
  const BuildTravelPlacesItem({
    super.key,
    required this.allDocs,
    required this.index,
  });

  final List<QueryDocumentSnapshot<Object?>>? allDocs;
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final arabicNumber = ArabicNumbers();
    List<PlaceModel>? placeList;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
              List<PlaceModel> placeListt = [];
              for (int i = 0; i < allDocs!.length; i++) {
                placeListt.add(PlaceModel.fromJson(allDocs![i]));
                placeList = placeListt;

              }
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PlaceScreenNew(
                docID: allDocs![index].id,
                placeModel: placeList![index],


              );
            }));
          },
          child: Container(
            width: screenWidth * 0.48,
            height: screenHeight * 0.47,
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(
                width: 0.1,
                color: Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                //---------------------------------------------------------------------
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(
                      allDocs![index]['imageUrl'],
                    ),
                    fit: BoxFit.cover,
                    height: 100,
                    width: 250,
                  ),
                ),
                kSizedBox,
                //---------------------------------------------------------------------
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isArabic() ? allDocs![index]['nameArabic']:
                        allDocs![index]['name'],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          RatingBar(
                              ignoreGestures: true,
                              itemSize: 16,
                              initialRating: allDocs![index]['rate'].toDouble(),
                              allowHalfRating: true,
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                half: Icon(
                                  Icons.star_half,
                                  color: Colors.orange,
                                ),
                                empty: Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.orange,
                                ),
                              ),
                              onRatingUpdate: (rating) {}),
                          SizedBox(width: 5,),
                          isArabic() ? Text('(${arabicNumber.convert(allDocs![index]['rate'].toString())})'):
                          Text('(${allDocs![index]['rate'].toString()})'),

                        ],
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
