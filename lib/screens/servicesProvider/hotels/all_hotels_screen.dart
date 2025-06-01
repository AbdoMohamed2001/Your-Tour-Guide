import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/hotel_screen.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/deafult_cached_network_image.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../feature_grid_item.dart';
import '../../../utils/utils.dart';
import '../../../widgets/sort_by_widget.dart';

class AllHotels extends StatelessWidget {
  static String id = 'allHotels';
  final String cityName;

  AllHotels({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    CollectionReference hotels =
        FirebaseFirestore.instance.collection('hotels');
    List<HotelModel>? hotelList;

    return BlocProvider(
      create: (context) => PlaceCubit(),
      child: BlocBuilder<PlaceCubit, PlaceState>(
        builder: (context, state) {
          var hotelCubit = PlaceCubit.get(context);
          return FutureBuilder<QuerySnapshot>(
              future: cityName == ''
                  ? hotels
                      .orderBy(
                          isArabic()
                              ? hotelCubit.orderArabic
                              : hotelCubit.order,
                          descending: hotelCubit.isDescending)
                      .get()
                  : hotels
                      .where('cityName', isEqualTo: cityName)
                      .orderBy(
                          isArabic()
                              ? hotelCubit.orderArabic
                              : hotelCubit.order,
                          descending: hotelCubit.isDescending)
                      .get(),
              builder: (context, snapshot) {
                final List<QueryDocumentSnapshot>? allDocs =
                    snapshot.data?.docs;
                if (allDocs == null) {
                  Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  List<HotelModel> hotelListt = [];
                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    hotelListt.add(HotelModel.fromJson(snapshot.data!.docs[i]));
                    hotelList = hotelListt;
                  }

                  return Scaffold(
                    appBar: CustomAppBar(
                      title: S.of(context).AllHotels,
                      leading: CustomAppBarIconButton(),
                    ),
                    body: ListView(
                      shrinkWrap: true,
                      children: [
                        SortByWidget(
                          cubit: hotelCubit,
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: screenHeight * 0.562,
                            mainAxisSpacing: 6,
                          ),
                          itemBuilder: (_, index) => BuildHotelGridItem(
                            hotelModel: hotelList![index],
                            docID: allDocs[index].id,
                          ),
                          itemCount: snapshot.data!.docs.length,
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  );
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class BuildHotelGridItem extends StatelessWidget {
  const BuildHotelGridItem({
    Key? key,
    required this.hotelModel,
    required this.docID,
  }) : super(key: key);

  final HotelModel hotelModel;
  final String? docID;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HotelScreen(
            docID: docID,
            hotelModel: hotelModel,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Stack(
                children: [
                  DefaultCachedNetworkImage(
                    imageUrl: hotelModel.imageUrl!,
                    imageHeight: screenHeight * 0.42,
                    // imageHeight: 260,
                  ),
                  Positioned(
                    bottom: 50,
                    // top: screenHeight * 0.284,
                    right: isArabic() ? 5 : null,
                    left: isArabic() ? null : 5,
                    child: BorderedText(
                      strokeWidth: 3,
                      strokeColor: HomeCubit.get(context).isDark!
                          ? Colors.black
                          : Colors.white,
                      child: Text(
                        isArabic() ? hotelModel.nameArabic! : hotelModel.name!,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    // top: screenHeight * 0.310,
                    right: isArabic() ? 8 : null,
                    left: isArabic() ? null : 8,
                    child: BorderedText(
                      strokeWidth: 3,
                      strokeColor: HomeCubit.get(context).isDark!
                          ? Colors.black
                          : Colors.white,
                      child: Text(
                        isArabic()
                            ? hotelModel.cityNameArabic!
                            : hotelModel.cityName!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    // top: screenHeight * 0.34,
                    right: isArabic() ? 8 : null,
                    left: isArabic() ? null : 8,
                    child: RatingBar(
                        textDirection:
                            isArabic() ? TextDirection.rtl : TextDirection.ltr,
                        ignoreGestures: true,
                        itemSize: 24,
                        initialRating: hotelModel.stars!.toDouble(),
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
                          empty: Container(),
                        ),
                        onRatingUpdate: (rating) {}),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildFeatureGridItem(
                  index: 0,
                  hotelModel: hotelModel,
                  height: 75,
                  width: screenWidth / 9,
                ),
                BuildFeatureGridItem(
                  index: 1,
                  hotelModel: hotelModel,
                  height: 75,
                  width: screenWidth / 9,
                ),
                BuildFeatureGridItem(
                  index: 2,
                  hotelModel: hotelModel,
                  height: 75,
                  width: screenWidth / 9,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class BuildHotelItem extends StatelessWidget {
//   const BuildHotelItem({
//     Key? key,
//     required this.hotelModel,
//     required this.docID,
//   }) : super(key: key);
//
//   final HotelModel hotelModel;
//   final String? docID;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return HotelScreen(
//             docID: docID,
//             hotelModel: hotelModel,
//           );
//         }));
//       },
//       child: Container(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 5,
//               ),
//               Stack(
//                 children: [
//                   DefaultCachedNetworkImage(
//                     imageUrl: hotelModel.imageUrl!,
//                     imageHeight: 220,
//                   ),
//                   // CachedNetworkImage(
//                   //   imageUrl: hotelModel.imageUrl!,
//                   //   width: double.infinity,
//                   //   height: 220,
//                   //   fit: BoxFit.cover,
//                   //   placeholder: (context, url) =>
//                   //       Center(
//                   //         child: Container(
//                   //           color: Colors.grey,
//                   //           width: double.infinity,
//                   //           height: 200,
//                   //           child: CircularProgressIndicator(
//                   //             color: Colors.orange,
//                   //           ),
//                   //         ),
//                   //
//                   //       ),
//                   //   errorWidget: (context, url, error) => Center(
//                   //     child: Container(
//                   //       color: Colors.grey,
//                   //       width: double.infinity,
//                   //       height: 200,
//                   //       child: CircularProgressIndicator(
//                   //         color: Colors.orange,
//                   //       ),
//                   //     ),
//                   //
//                   //   ),
//                   // ),
//                   // Image(
//                   //   image: NetworkImage('${hotelModel.imageUrl}'),
//                   //   width: double.infinity,
//                   //   height: 220,
//                   //   fit: BoxFit.cover,
//                   // ),
//                   //cityName
//                   Positioned(
//                     top: 165,
//                     right: isArabic() ? 15 : null,
//                     left: isArabic() ? null : 15,
//                     child: BorderedText(
//                       strokeWidth: 3,
//                       strokeColor: HomeCubit.get(context).isDark!
//                           ? Colors.black
//                           : Colors.white,
//                       child: Text(
//                         isArabic() ? hotelModel.nameArabic! : hotelModel.name!,
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   //rate
//                   // Positioned(
//                   //   top: 175,
//                   //   right: isArabic() ? null : 15,
//                   //   left:  isArabic() ? 15 : null,
//                   //   child: BorderedText(
//                   //     strokeWidth: 3,
//                   //     strokeColor:  homeCubit.isDark! ? Colors.black :Colors.white,
//                   //
//                   //     child: Text(
//                   //       hotelModel.rate!.toString(),
//                   //       style: TextStyle(fontSize: 20),
//                   //
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//               kSizedBox,
//               //-------------------------------------------------------------
//               //name and rate
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     isArabic()
//                         ? hotelModel.cityNameArabic!
//                         : hotelModel.cityName!,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       // Text('فندق 5 نجوم',
//                       // style: TextStyle(fontWeight: FontWeight.bold),
//                       // ),
//                       // SizedBox(width: 10,),
//                       RatingBar(
//                           textDirection: isArabic()
//                               ? TextDirection.rtl
//                               : TextDirection.ltr,
//                           ignoreGestures: true,
//                           itemSize: 24,
//                           initialRating: hotelModel.stars!.toDouble(),
//                           allowHalfRating: true,
//                           ratingWidget: RatingWidget(
//                             full: Icon(
//                               Icons.star,
//                               color: Colors.orange,
//                             ),
//                             half: Icon(
//                               Icons.star_half,
//                               color: Colors.orange,
//                             ),
//                             empty: Container(),
//                           ),
//                           onRatingUpdate: (rating) {}),
//                     ],
//                   ),
//                 ],
//               ),
//               //-------------------------------------------------------------
//               //address
//               isArabic()
//                   ? Text(hotelModel.addressArabic!)
//                   : Text(hotelModel.address!),
//               kSizedBox,
//               //features
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   BuildFeatureItem(hotelModel: hotelModel, index: 0),
//                   BuildFeatureItem(hotelModel: hotelModel, index: 1),
//                   BuildFeatureItem(hotelModel: hotelModel, index: 2),
//                   // BuildFeatureItem(hotelModel: hotelModel, index: 3),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//                        // ListView.separated(
//                         //   shrinkWrap: true,
//                         //   physics: ClampingScrollPhysics(),
//                         //   itemBuilder: (context, index) => BuildHotelItem(
//                         //     hotelModel: hotelList![index],
//                         //     docID: allDocs[index].id,
//                         //   ),
//                         //   itemCount: snapshot.data!.docs.length,
//                         //   separatorBuilder: (context, index) => SizedBox(
//                         //     height: 20,
//                         //   ),
//                         // ),
