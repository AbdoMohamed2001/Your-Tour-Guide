import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/models/cinema_model.dart';
import 'package:your_tour_guide/models/mall_model.dart';
import 'package:your_tour_guide/models/mosque_model.dart';
import 'package:your_tour_guide/core/data/models/place_model.dart';
import 'package:your_tour_guide/models/restaurant_model.dart';
import 'package:your_tour_guide/screens/places/place_screen_new.dart';
import 'package:your_tour_guide/screens/servicesProvider/cinemas/cinema_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/malls,%20mosques%20and%20churchs/mall_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/mosques%20and%20churchs/mosque_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/restaurants%20and%20cafes/restaurants_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/tourGuides/tour_guides.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/deafult_cached_network_image.dart';
import 'package:your_tour_guide/widgets/location_widget.dart';
import 'package:your_tour_guide/widgets/place_sort_by.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/utils.dart';

class AllScreen extends StatelessWidget {
  AllScreen({
    Key? key,
    required this.collectionName,
    required this.appBarText,
    required this.cityName,
  }) : super(key: key);
  static String id = 'AllScreen';
  final String collectionName;
  final String appBarText;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(collectionName);
    List<PlaceModel>? placeList;
    List<RestaurantModel>? restaurantsList;
    List<MallModel>? mallList;
    List<MosqueModel>? mosqueList;
    List<CinemaModel>? cinemaList;
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarText,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => PlaceCubit(),
        child: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var cubit = PlaceCubit.get(context);

            return FutureBuilder<QuerySnapshot>(
                future: cityName == ''
                    ? collectionReference
                        .orderBy(
                            isArabic()
                                ? cubit.servicesOrderArabic
                                : cubit.servicesOrder,
                            descending: cubit.isDescending)
                        .get()
                    : collectionReference
                        .where('cityName', isEqualTo: cityName)
                        .orderBy(
                            isArabic()
                                ? cubit.servicesOrderArabic
                                : cubit.servicesOrder,
                            descending: cubit.isDescending)
                        .get(),
                builder: (context, snapshot) {
                  final List<QueryDocumentSnapshot>? allDocs =
                      snapshot.data?.docs;
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
                        placeListt
                            .add(PlaceModel.fromJson(snapshot.data!.docs[i]));
                        placeList = placeListt;
                      }
                    }
                    //------------------------------------------------------------------------
                    if (collectionName == 'mosques' ||
                        collectionName == 'churchs') {
                      List<MosqueModel> mosqueListt = [];
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        mosqueListt
                            .add(MosqueModel.fromJson(snapshot.data!.docs[i]));
                        mosqueList = mosqueListt;
                      }
                    }
                    //------------------------------------------------------------------------
                    else if (collectionName == 'tours') {
                    }
                    //-------------------------------------------------------------------------
                    else if (collectionName == 'restaurants' ||
                        collectionName == 'cafes') {
                      List<RestaurantModel> restaurantsListt = [];
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        restaurantsListt.add(
                            RestaurantModel.fromJson(snapshot.data!.docs[i]));
                        restaurantsList = restaurantsListt;
                      }
                    }
                    //-------------------------------------------------------------------------
                    else if (collectionName == 'malls') {
                      List<MallModel> mallListt = [];
                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        mallListt
                            .add(MallModel.fromJson(snapshot.data!.docs[i]));
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
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        PlaceSortBy(cubit: cubit),
                        SizedBox(
                          height: 10,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: screenHeight * 0.43,
                            mainAxisSpacing: 6,
                          ),
                          itemBuilder: (context, index) =>
                              BuildAllServicesGridItem(
                            index: index,
                            allDocs: allDocs,
                            itemNameOnFireBase: isArabic()
                                ? allDocs[index]['nameArabic']
                                : allDocs[index]['name'],
                            imageUrl: allDocs[index]['imageUrl'],
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
                                    collectionName == 'mosques' ||
                                            collectionName == 'churchs'
                                        ? MosqueScreen(
                                            mosqueModel: mosqueList![index],
                                            docID: allDocs[index].id,
                                            collectionName: collectionName,
                                          )
                                        :

                                        //-----------------------------------------------------------------
                                        collectionName == 'restaurants' ||
                                                collectionName == 'cafes'
                                            ? RestaurantScreen(
                                                docID: allDocs[index].id,
                                                restaurantModel:
                                                    restaurantsList![index],
                                                collectionName: collectionName,
                                              )
                                            :
                                            //-----------------------------------------------------------------
                                            collectionName == 'malls'
                                                ? MallNewScreen(
                                                    collectionName:
                                                        collectionName,
                                                    docID: allDocs[index].id,
                                                    mallModel: mallList![index],
                                                  )
                                                :
                                                //-----------------------------------------------------------------

                                                //-----------------------------------------------------------------
                                                CinemaScreen(
                                                    cinemaModel:
                                                        cinemaList![index],
                                                    docID: allDocs[index].id,
                                                  ),
                          ),
                          itemCount: snapshot.data!.docs.length,
                        )
                      ],
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
                });
          },
        ),
      ),
    );
  }
}

//AllFeaturesGridView(
//                   imageUrl: allDocs[index]['imageUrl'],
//                   itemNameOnFireBase: isArabic()? allDocs[index]['nameArabic']:allDocs[index]['name'],
//                   index: index,
//                   allDocs: allDocs,
//                   pushedPage: collectionName == 'places'
//                   ? PlaceScreenNew(
//                   docID: allDocs[index].id,
//                   placeModel: placeList![index],
//
//                   )
//                       :
//                   //-----------------------------------------------------------------
//                   collectionName == 'TourGuides'
//             ? TourGuideScreen(
//             tourGuideData: allDocs,
//             currentIndex: index,
//             )
//                 :
//             //-----------------------------------------------------------------
//             collectionName == 'mosques' || collectionName == 'churchs'
//             ? MosqueScreen(
//             mosqueModel: mosqueList![index],
//             docID: allDocs[index].id,
//             collectionName: collectionName,)
//                 :
//
//             //-----------------------------------------------------------------
//             collectionName == 'restaurants' ||
//             collectionName == 'cafes'
//             ? RestaurantScreen(
//             docID: allDocs[index].id,
//             restaurantModel: restaurantsList![index],
//             collectionName: collectionName,
//             )
//                 :
//             //-----------------------------------------------------------------
//             collectionName == 'malls'
//             ? MallNewScreen(
//             collectionName: collectionName,
//             docID: allDocs[index].id,
//             mallModel: mallList![index],
//             )
//                 :
//             //-----------------------------------------------------------------
//
//
//             //-----------------------------------------------------------------
//             CinemaScreen(
//             cinemaModel: cinemaList![index],
//             docID: allDocs[index].id,
//             ),
//             ),

class BuildAllServicesGridItem extends StatelessWidget {
  const BuildAllServicesGridItem({
    Key? key,
    required this.index,
    @required this.allDocs,
    required this.pushedPage,
    required this.itemNameOnFireBase,
    required this.imageUrl,
  }) : super(key: key);
  final List<QueryDocumentSnapshot>? allDocs;
  final int index;
  final Widget pushedPage;
  final String itemNameOnFireBase;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pushedPage;
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
                    imageUrl: imageUrl,
                    imageHeight: screenHeight * 0.42,
                    // imageHeight: 260,
                  ),
                  //name
                  Positioned(
                    bottom: 55,
                    // top: screenHeight * 0.284,
                    right: isArabic() ? 5 : null,
                    left: isArabic() ? null : 5,
                    child: BorderedText(
                      strokeWidth: 3,
                      strokeColor: HomeCubit.get(context).isDark!
                          ? Colors.black
                          : Colors.white,
                      child: Text(
                        isArabic()
                            ? allDocs![index]['nameArabic']
                            : allDocs![index]['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //city
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
                            ? allDocs![index]['cityNameArabic']
                            : allDocs![index]['cityName'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    // top: screenHeight * 0.34,
                    right: isArabic() ? 8 : null,
                    left: isArabic() ? null : 8,
                    child: RateWidget(
                      rate: allDocs![index]['rate'],
                      starIconIncluded: false,
                    ),
                  ),

                  // Positioned(
                  //   bottom: 10,
                  //   // top: screenHeight * 0.310,
                  //   right: isArabic() ? 8 : null,
                  //   left: isArabic() ? null : 8,
                  //   child: BorderedText(
                  //     strokeWidth: 3,
                  //     strokeColor: HomeCubit.get(context).isDark!
                  //         ? Colors.black
                  //         : Colors.white,
                  //     child: Text(
                  //       isArabic()
                  //           ? allDocs![index]['typeArabic']
                  //           : allDocs![index]['type'],
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
