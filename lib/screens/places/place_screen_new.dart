import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/place_model.dart';
import 'package:your_tour_guide/models/tour_model.dart';
import 'package:your_tour_guide/screens/all_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/all_hotels_screen.dart';
import 'package:your_tour_guide/tour_screen_neew.dart';
import 'package:your_tour_guide/widgets/default_read_more.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/location_widget.dart';
import 'package:your_tour_guide/widgets/nearly_item.dart';
import 'package:your_tour_guide/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/widgets/place/custom_place_image.dart';
import 'package:your_tour_guide/widgets/place/gallery_widget.dart';
import 'package:your_tour_guide/widgets/place/how_to_go_widget.dart';
import 'package:your_tour_guide/widgets/tickets_widget.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/utils.dart';

class PlaceScreenNew extends StatelessWidget {
  PlaceScreenNew({
    Key? key,
    required this.placeModel,
    required this.docID,
  }) : super(key: key);

  final PlaceModel placeModel;
  final docID;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    List<NearlyPlaceModel> nearlyList = [
      //Hotels
      NearlyPlaceModel(
        containerColor: Colors.black,
        iconName: FontAwesomeIcons.hotel,
        iconColor: Color(0xff613207),
        containerName: S.current.Hotels,
        pushedPage: AllHotels(cityName: placeModel.cityName!),
      ),
      //Restaurants
      NearlyPlaceModel(
        containerColor: Color(0xff613207),
        iconName: FontAwesomeIcons.utensils,
        iconColor: Colors.black,
        containerName: S.current.Restaurants,
        pushedPage: AllScreen(
          collectionName: 'restaurants',
          appBarText: S.current.AllRestaurants,
          cityName: placeModel.cityName!,
        ),
      ),
      //Cafes
      NearlyPlaceModel(
        containerColor: Color(0xff613207),
        iconName: FontAwesomeIcons.mugHot,
        iconColor: Colors.black,
        containerName: S.current.Cafes,
        pushedPage: AllScreen(
          collectionName: 'cafes',
          appBarText: S.current.AllCafes,
          cityName: placeModel.cityName!,
        ),
      ),
      // //Cinemas
      NearlyPlaceModel(
        containerColor: Color(0xff66191c),
        iconName: FontAwesomeIcons.film,
        iconColor: Colors.black,
        containerName: S.current.Cinemas,
        pushedPage: AllScreen(
          collectionName: 'cinemas',
          appBarText: S.current.AllCinemas,
          cityName: placeModel.cityName!,
        ),
      ),
    ];
    CollectionReference tour = FirebaseFirestore.instance.collection('tours');
    List<TourModel>? tourList;
    return BlocProvider(
      create: (context) => PlaceCubit()
        ..likedKey = docID
        ..restorePersistedPref(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: PreferredSize(
        //     preferredSize: const Size.fromHeight(-0.5),
        //     child: AppBar(
        //       elevation: 0,
        //
        //     ),
        //
        // ),
        body: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var placeCubit = PlaceCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomPlaceImage(
                    docID: docID,
                    imageUrl: placeModel.imageUrl,
                    name: isArabic() ? placeModel.nameArabic : placeModel.name,
                    cityName: isArabic()
                        ? placeModel.cityNameArabic
                        : placeModel.cityName,
                    containerImage: placeModel.images![0],
                    cubitLikedValue: placeCubit.likedValue,
                    favouriteFunction: () {
                      placeCubit.changeLike();
                      if (placeCubit.likedValue == true) {
                        CacheData.setData(
                            key: placeCubit.likedKey,
                            value: placeCubit.likedValue);
                        placeCubit.addPlaceToFavourite(
                          placeModel: placeModel,
                          docID: docID,
                          context: context,
                        );
                      } else {
                        CacheData.setData(
                            key: placeCubit.likedKey,
                            value: placeCubit.likedValue);
                        placeCubit.deleteFromFavourite(
                          context: context,
                          docID: docID,
                        );
                      }
                    },
                    cubitDataKeyCurrentContext:
                        placeCubit.dataKey.currentContext,
                    images: placeModel.images!,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kSizedBox,
                        //-------------------------------------------------------------------
                        //location and googleMaps
                        LocationWidget(
                          address: isArabic()
                              ? placeModel.addressArabic
                              : placeModel.address,
                          englishAddress: placeModel.address,
                          mapUrl: placeModel.mapUrl,
                          rate: placeModel.rate,
                        ),
                        //-------------------------------------------------------------------
                        //Opening hours
                        kSizedBox,
                        // ignore: missing_required_param
                        BuildOpeningHoursItem(
                          openFrom: isArabic()
                              ? placeModel.openingHoursArabic!['from']
                              : placeModel.openingHours!['from'],
                          openTo: isArabic()
                              ? placeModel.openingHoursArabic!['to']
                              : placeModel.openingHours!['to'],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //-------------------------------------------------------------------
                        //tickets
                        TicketsWidget(model: placeModel),
                        kSizedBox,
                        //-------------------------------------------------------------------
                        //Description and rate
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: HeadText(
                            text: S.of(context).Description,
                          ),
                        ),
                        kSizedBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultReadMoreWidget(
                            text: isArabic()
                                ? placeModel.descriptionArabic!
                                : placeModel.description!,
                          ),
                        ),
                        kSizedBox,
                        Divider(
                          height: 0.5,
                          thickness: 1,
                          // indent: 30,
                          // endIndent: 30,
                          color: Colors.grey[300],
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------
                        //How to go

                        //-------------------------------------------------------------------
                        //Metro
                        placeModel.transport!['metro'] == '' ||
                                placeModel.transportArabic!['metro'] == ''
                            ? Container(
                                width: 0,
                                height: 0,
                              )
                            : HowToGoWidget(placeModel: placeModel),
                        //-------------------------------------------------------------------
                        //Transport
                        kSizedBox,
                        placeModel.transport!['transport'].length == 0 ||
                                placeModel
                                        .transportArabic!['transport'].length ==
                                    0
                            ? Container(
                                width: 0,
                                height: 0,
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadText(text: S.of(context).transport),
                                    ListView.separated(
                                      padding: EdgeInsets.all(0),
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (_, index) => Text(
                                        isArabic()
                                            ? placeModel.transportArabic![
                                                'transport'][index]
                                            : placeModel.transport!['transport']
                                                [index],
                                      ),
                                      separatorBuilder: (_, index) => SizedBox(
                                        height: 2,
                                      ),
                                      itemCount: isArabic()
                                          ? placeModel
                                              .transportArabic!['transport']
                                              .length
                                          : placeModel
                                              .transport!['transport'].length,
                                    ),
                                    kSizedBox,
                                  ],
                                ),
                              ),
                        //-------------------------------------------------------------------
                        //Gallery
                        GalleryWidget(cubit: placeCubit, model: placeModel),
                        //-------------------------------------------------------------------
                        //Nearly
                        HeadText(text: S.of(context).nearly),
                        kSizedBox,
                        SizedBox(
                          height: 60,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => NearlyPlaceItem(
                              containerColor: nearlyList[index].containerColor,
                              iconName: nearlyList[index].iconName,
                              iconColor: nearlyList[index].iconColor,
                              containerName: nearlyList[index].containerName,
                              pushedPage: nearlyList[index].pushedPage,
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                            itemCount: 4,
                          ),
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------
                        //Tour
                        placeModel.includeTour == true
                            ? HeadText(text: S.of(context).toursToPlace)
                            : Container(),
                        placeModel.includeTour == true
                            ? SizedBox(
                                height: 5,
                              )
                            : Container(),

                        placeModel.includeTour == true
                            ? FutureBuilder<QuerySnapshot>(
                                future: tour
                                    .where('docId',
                                        isEqualTo: placeModel.tourDocId)
                                    .get(),
                                builder: (context, snapshot) {
                                  List<QueryDocumentSnapshot>? allDocs =
                                      snapshot.data?.docs;
                                  if (snapshot.data == null) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.orange,
                                      ),
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    List<TourModel> tourListt = [];
                                    for (int i = 0;
                                        i < snapshot.data!.docs.length;
                                        i++) {
                                      tourListt.add(TourModel.fromJson(
                                          snapshot.data!.docs[i]));
                                      tourList = tourListt;
                                    }

                                    return SizedBox(
                                      height: 100,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        TourScreenNeew(
                                                          placeModel:
                                                              tourList![index],
                                                          docID: allDocs![index]
                                                              .id,
                                                        )));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0),
                                            child: Container(
                                              width: 180,
                                              height: 150,
                                              child: Stack(
                                                children: [
                                                  Image(
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      } else {
                                                        return Center(
                                                          child: Container(
                                                            width: 180,
                                                            height: 150,
                                                            child: Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: Colors
                                                                    .orange,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    width: 180,
                                                    height: 150,
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        allDocs![index]
                                                            ['imageUrl']),
                                                  ), //Done
                                                  //Pyramids
                                                  Positioned(
                                                    top: 65,
                                                    right:
                                                        isArabic() ? 15 : null,
                                                    left:
                                                        isArabic() ? null : 15,
                                                    child: BorderedText(
                                                      strokeColor: Colors.black,
                                                      strokeWidth: 2,
                                                      strokeCap: StrokeCap.butt,
                                                      strokeJoin:
                                                          StrokeJoin.bevel,
                                                      child: Text(
                                                        isArabic()
                                                            ? allDocs[index]
                                                                ['nameArabic']
                                                            : allDocs[index]
                                                                ['name'],
                                                        maxLines: 2,
                                                        // snapshot.data!['Name'],
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ), //Done
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          width: 10,
                                        ),
                                        itemCount: allDocs!.length,

                                        //allDocs!.length
                                      ),
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.orange,
                                    ),
                                  );
                                },
                              )
                            : Container(),
                        SizedBox(
                          height: 10,
                        ),

                        //-------------------------------------------------------------------
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NearlyPlaceModel {
  final Color containerColor;
  final IconData iconName;
  final Color iconColor;
  final String containerName;
  final Widget pushedPage;

  NearlyPlaceModel({
    required this.containerColor,
    required this.iconName,
    required this.iconColor,
    required this.containerName,
    required this.pushedPage,
  });

// containerColor: Colors.black,
// iconName: FontAwesomeIcons.hotel,
// iconColor: Color(0xff613207),
// containerName: S.current.Hotels,
}
