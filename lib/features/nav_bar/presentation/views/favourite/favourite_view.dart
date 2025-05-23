import 'package:your_tour_guide/models/cinema_model.dart';
import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/models/mall_model.dart';
import 'package:your_tour_guide/core/data/models/place_model.dart';
import 'package:your_tour_guide/models/restaurant_model.dart';
import 'package:your_tour_guide/models/tour_model.dart';
import 'package:your_tour_guide/screens/places/place_screen_new.dart';
import 'package:your_tour_guide/screens/servicesProvider/cinemas/cinema_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/hotel_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/restaurants%20and%20cafes/restaurants_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/tourGuides/tour_guides.dart';
import 'package:your_tour_guide/tour_screen_neew.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../screens/servicesProvider/malls, mosques and churchs/mall_screen.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({
    Key? key,
    required this.collectionName,
    required this.appBarText,
  }) : super(key: key);
  final String collectionName;
  final String appBarText;

  @override
  Widget build(BuildContext context) {
    List<PlaceModel>? placeList;
    List<RestaurantModel>? restaurantsList;
    List<MallModel>? mallList;
    List<CinemaModel>? cinemaList;
    List<HotelModel>? hotelList;
    List<TourModel>? tourList;

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var docId = _auth.currentUser!.email.toString();
    final Stream<QuerySnapshot> favourite = FirebaseFirestore.instance
        .collection('favouritePlaces')
        .doc(docId)
        .collection(collectionName)
        .snapshots();
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarText,
        leading: CustomAppBarIconButton(),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: favourite,
          builder: (context, snapshot) {
            final List<QueryDocumentSnapshot>? allDocs = snapshot.data?.docs;
            if (allDocs == null) {
              debugPrint('data is null');
              Scaffold(
                body: Center(
                  child: Text('data is null'),
                ),
              );
            } else if (!snapshot.hasData) {
              return Text('no data');
            } else if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (snapshot.hasData) {
              //-------------------------------------------------------------------------
              if (collectionName == 'places') {
                List<PlaceModel> placeListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  placeListt.add(PlaceModel.fromJson(snapshot.data!.docs[i]));
                  placeList = placeListt;
                }
              }
              //-------------------------------------------------------------------------
              else if (collectionName == 'tours') {
                List<TourModel> tourListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  tourListt.add(TourModel.fromJson(snapshot.data!.docs[i]));
                  tourList = tourListt;
                }
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
                }
              }
              //-------------------------------------------------------------------------
              else if (collectionName == 'malls' ||
                  collectionName == 'mosques' ||
                  collectionName == 'churches') {
                List<MallModel> mallListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  mallListt.add(MallModel.fromJson(snapshot.data!.docs[i]));
                  mallList = mallListt;
                }
              }
              //-------------------------------------------------------------------------
              else if (collectionName == 'cinemas') {
                List<CinemaModel> cinemasListt = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  cinemasListt
                      .add(CinemaModel.fromJson(snapshot.data!.docs[i]));
                  cinemaList = cinemasListt;
                }
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, int index) => BuildFavouriteItem(
                  pushedPage: collectionName == 'places'
                      ? PlaceScreenNew(
                          docID: allDocs[index].id,
                          placeModel: placeList![index],
                        )
                      :
                      //-----------------------------------------------------------------
                      collectionName == 'tours'
                          ? TourScreenNeew(
                              docID: allDocs[index].id,
                              placeModel: tourList![index],
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
                                          collectionName: collectionName,
                                          docID: allDocs[index].id,
                                          restaurantModel:
                                              restaurantsList![index],
                                        )
                                      :
                                      //-----------------------------------------------------------------
                                      collectionName == 'malls' ||
                                              collectionName == 'mosques' ||
                                              collectionName == 'churches'
                                          ? MallNewScreen(
                                              docID: allDocs[index].id,
                                              collectionName: collectionName,
                                              mallModel: mallList![index],
                                            )
                                          :
                                          //-----------------------------------------------------------------
                                          CinemaScreen(
                                              cinemaModel: cinemaList![index],
                                              docID: allDocs[index].id,
                                            ),
                  allDocs: allDocs,
                  index: index,
                ),
                separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
                itemCount: allDocs.length,
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: Text('error with connection'),
              );
            }
            return Center(
                child: CircularProgressIndicator(
              color: Colors.orange,
            ));
          }),
    );
  }
}

class BuildFavouriteItem extends StatelessWidget {
  const BuildFavouriteItem({
    Key? key,
    required this.pushedPage,
    required this.allDocs,
    required this.index,
  }) : super(key: key);
  final Widget pushedPage;
  final List<QueryDocumentSnapshot<Object?>>? allDocs;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pushedPage,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image(
                image: NetworkImage('${allDocs?[index]['imageUrl']}'),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 145,
                left: isArabic() ? null : 15,
                right: isArabic() ? 15 : null,
                child: BorderedText(
                  strokeColor: Colors.black,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  strokeJoin: StrokeJoin.bevel,
                  child: Text(
                    isArabic()
                        ? allDocs![index]['nameArabic']
                        : '${allDocs?[index]['name']}',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ), //Done
            ],
          ),
        ),
      ),
    );
  }
}
