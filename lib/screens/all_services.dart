import 'package:your_tour_guide/models/cinema_model.dart';
import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/models/mall_model.dart';
import 'package:your_tour_guide/core/data/models/place_model.dart';
import 'package:your_tour_guide/models/restaurant_model.dart';
import 'package:your_tour_guide/screens/places/place_screen_new.dart';
import 'package:your_tour_guide/screens/servicesProvider/cinemas/cinema_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/hotel_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/malls,%20mosques%20and%20churchs/mall_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/restaurants%20and%20cafes/restaurants_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/tourGuides/tour_guides.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/list_view_all_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AllServicesView extends StatelessWidget {
  AllServicesView({
    Key? key,
    required this.collectionName,
    required this.appBarText,
  }) : super(key: key);
  static String id = 'AllPlaces';
  final String collectionName;
  final String appBarText;

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collectionName);
    List<PlaceModel>? placeList;
    List<RestaurantModel>? restaurantsList;
    List<MallModel>? mallList;
    List<CinemaModel>? cinemaList;
    List<HotelModel>? hotelList;
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarText,
        leading: CustomAppBarIconButton(),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: collectionReference.get(),
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
              //------------------------------------------------------------------------
              else if (collectionName == 'tours') {
              }
              //-------------------------------------------------------------------------
              else if (collectionName == 'hotels') {
                List<HotelModel> hotelListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  hotelListt.add(HotelModel.fromJson(snapshot.data!.docs[i]));
                  hotelList = hotelListt;
                }
              }
              //-------------------------------------------------------------------------
              else if (collectionName == 'restaurants' ||
                  collectionName == 'cafes') {
                List<RestaurantModel> restaurantsListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  restaurantsListt
                      .add(RestaurantModel.fromJson(snapshot.data!.docs[i]));
                  restaurantsList = restaurantsListt;
                  print('data added to list $collectionName');
                }
              }
              //-------------------------------------------------------------------------
              else if (collectionName == 'malls' ||
                  collectionName == 'mosques' ||
                  collectionName == 'churchs') {
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
                          collectionName == 'hotels'
                              ? HotelScreen(
                                  docID: allDocs[index].id,
                                  hotelModel: hotelList![index],
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
                                          collectionName == 'mosques' ||
                                          collectionName == 'churchs'
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
