import 'package:your_tour_guide/models/cinema_model.dart';
import 'package:your_tour_guide/models/mall_model.dart';
import 'package:your_tour_guide/core/data/models/place_model.dart';
import 'package:your_tour_guide/models/restaurant_model.dart';
import 'package:your_tour_guide/screens/places/place_screen_new.dart';
import 'package:your_tour_guide/screens/servicesProvider/cinemas/cinema_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/malls,%20mosques%20and%20churchs/mall_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/restaurants%20and%20cafes/restaurants_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/tourGuides/tour_guides.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/list_view_all_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class AllPlaces extends StatelessWidget {
  AllPlaces({
    Key? key,
    required this.collectionName,
    required this.appBarText,
    required this.isBest,
  }) : super(key: key);
  static String id = 'AllPlaces';
  final String collectionName;
  final String appBarText;
  final bool isBest;

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collectionName);
    List<PlaceModel>? placeList;
    List<RestaurantModel>? restaurantsList;
    List<MallModel>? mallList;
    List<CinemaModel>? cinemaList;
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarText,
        leading: CustomAppBarIconButton(),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: collectionReference
              .where("isBest", isEqualTo: isBest && true)
              .get(),
          builder: (context, snapshot) {
            final List<QueryDocumentSnapshot>? allDocs = snapshot.data?.docs;
            if (allDocs == null) {
              Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              print('this is collectionName $collectionName');
              //------------------------------------------------------------------------
              if (collectionName == 'places') {
                List<PlaceModel> placeListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  placeListt.add(PlaceModel.fromJson(snapshot.data!.docs[i]));
                  placeList = placeListt;
                }
              }
              //-------------------------------------------------------------------------

              else if (collectionName == 'restaurants' ||
                  collectionName == 'cafes') {
                print('this is restaurant collectionName');
                List<RestaurantModel> restaurantsListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  restaurantsListt
                      .add(RestaurantModel.fromJson(snapshot.data!.docs[i]));
                  restaurantsList = restaurantsListt;
                }
              }
              //-------------------------------------------------------------------------
              else if (collectionName == 'malls' ||
                  collectionName == 'mallsArabic' ||
                  collectionName == 'mosques' ||
                  collectionName == 'mosquesArabic' ||
                  collectionName == 'churches' ||
                  collectionName == 'churchesArabic') {
                List<MallModel> mallListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  mallListt.add(MallModel.fromJson(snapshot.data!.docs[i]));
                  mallList = mallListt;
                }
              }
              //-------------------------------------------------------------------------
              else if (collectionName == 'cinemas' ||
                  collectionName == 'cinemasArabic') {
                List<CinemaModel> cinemasListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  cinemasListt
                      .add(CinemaModel.fromJson(snapshot.data!.docs[i]));
                  cinemaList = cinemasListt;
                }
              }
              //-------------------------------------------------------------------------
              return ListView.separated(
                itemBuilder: (context, index) => BuildAllItem(
                  imageUrl: allDocs[index]['imageUrl'],
                  itemNameOnFireBase: isArabic()
                      ? allDocs[index]['nameArabic']
                      : allDocs[index]['name'],
                  index: index,
                  allDocs: allDocs,
                  pushedPage: collectionName == 'places'
                      ? PlaceScreenNew(
                          docID: allDocs[index].id,
                          placeModel: placeList![index],
                        )
                      :
                      //-----------------------------------------------------------------
                      collectionName == 'TourGuides'
                          ? TourGuideScreen(
                              tourGuideData: allDocs,
                              currentIndex: index,
                            )
                          :
                          //-----------------------------------------------------------------
                          collectionName == 'restaurants' ||
                                  collectionName == 'cafes'
                              ? RestaurantScreen(
                                  docID: allDocs[index].id,
                                  restaurantModel: restaurantsList![index],
                                  collectionName: collectionName,
                                )
                              :
                              //-----------------------------------------------------------------
                              collectionName == 'malls' ||
                                      collectionName == 'mallsArabic' ||
                                      collectionName == 'mosques' ||
                                      collectionName == 'mosquesArabic' ||
                                      collectionName == 'churches' ||
                                      collectionName == 'churchesArabic'
                                  ? MallNewScreen(
                                      collectionName: collectionName,
                                      docID: allDocs[index].id,
                                      mallModel: mallList![index],
                                    )
                                  :
                                  //-----------------------------------------------------------------
                                  CinemaScreen(
                                      cinemaModel: cinemaList![index],
                                      docID: allDocs[index].id,
                                    ),
                ),
                // itemCount: placeList.length,
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, index) => SizedBox(height: 20),
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }),
    );
  }
}
