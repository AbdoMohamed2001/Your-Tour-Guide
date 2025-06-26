import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/location_widget.dart';
import 'package:your_tour_guide/core/utils/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/tour_model.dart';
import 'package:your_tour_guide/tour_screen_neew.dart';
import 'package:your_tour_guide/core/utils/widgets/default_read_more.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/place/custom_place_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart'
    show GalleryWidget;
import '../../../../../cubits/place_cubit/place_cubit.dart';
import '../../../../../core/utils/widgets/tickets_widget.dart';
import '../../../domian/entities/place_entity.dart';

class PlaceDetailsViewBody extends StatelessWidget {
  const PlaceDetailsViewBody({super.key, required this.placeEntity});

  final PlaceEntity placeEntity;

  @override
  Widget build(BuildContext context) {
    CollectionReference tour = FirebaseFirestore.instance.collection('tours');
    List<TourModel>? tourList;
    return BlocBuilder<PlaceCubit, PlaceState>(
      builder: (context, state) {
        var placeCubit = PlaceCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomPlaceImage(
                entity: placeEntity,
                cubitDataKeyCurrentContext: placeCubit.dataKey.currentContext,
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
                          ? placeEntity.addressArabic
                          : placeEntity.address,
                      mapUrl: placeEntity.mapUrl,
                      rate: placeEntity.rate,
                    ),
                    //-------------------------------------------------------------------
                    //Opening hours
                    kSizedBox,
                    // ignore: missing_required_param
                    BuildOpeningHoursItem(
                      openFrom: isArabic()
                          ? placeEntity.openingHoursArabic['from']
                          : placeEntity.openingHours['from'],
                      openTo: isArabic()
                          ? placeEntity.openingHoursArabic['to']
                          : placeEntity.openingHours['to'],
                    ),
                    SizedBox(height: 20),
                    //-------------------------------------------------------------------
                    //tickets
                    TicketsWidget(model: placeEntity),
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
                            ? placeEntity.descriptionArabic
                            : placeEntity.description,
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
                    placeEntity.transport['metro'] == '' ||
                            placeEntity.transportArabic['metro'] == ''
                        ? Container(
                            width: 0,
                            height: 0,
                          )
                        : Container(),
                    // : HowToGoWidget(placeModel: placeEntity),
                    //-------------------------------------------------------------------
                    //Transport
                    kSizedBox,
                    placeEntity.transport['transport'].length == 0 ||
                            placeEntity.transportArabic['transport'].length == 0
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
                                        ? placeEntity
                                            .transportArabic['transport'][index]
                                        : placeEntity.transport['transport']
                                            [index],
                                  ),
                                  separatorBuilder: (_, index) => SizedBox(
                                    height: 2,
                                  ),
                                  itemCount: isArabic()
                                      ? placeEntity
                                          .transportArabic['transport'].length
                                      : placeEntity
                                          .transport['transport'].length,
                                ),
                                kSizedBox,
                              ],
                            ),
                          ),
                    //-------------------------------------------------------------------
                    //Gallery
                    GalleryWidget(cubit: placeCubit, model: placeEntity),
                    //-------------------------------------------------------------------
                    //Nearly
                    HeadText(text: S.of(context).nearly),
                    kSizedBox,
                    // SizedBox(
                    //   height: 60,
                    //   child: ListView.separated(
                    //     scrollDirection: Axis.horizontal,
                    //     shrinkWrap: true,
                    //     itemBuilder: (context, index) => NearlyPlaceItem(
                    //       containerColor: nearlyList[index].containerColor,
                    //       iconName: nearlyList[index].iconName,
                    //       iconColor: nearlyList[index].iconColor,
                    //       containerName: nearlyList[index].containerName,
                    //       pushedPage: nearlyList[index].pushedPage,
                    //     ),
                    //     separatorBuilder: (context, index) => SizedBox(
                    //       width: 10,
                    //     ),
                    //     itemCount: 4,
                    //   ),
                    // ),
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Tour
                    placeEntity.includeTour == true
                        ? HeadText(text: S.of(context).toursToPlace)
                        : Container(),
                    placeEntity.includeTour == true
                        ? SizedBox(
                            height: 5,
                          )
                        : Container(),

                    placeEntity.includeTour == true
                        ? FutureBuilder<QuerySnapshot>(
                            future: tour
                                .where('docId',
                                    isEqualTo: placeEntity.tourDocId)
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
                                                builder: (_) => TourScreenNeew(
                                                      placeModel:
                                                          tourList![index],
                                                      docID: allDocs[index].id,
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
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  } else {
                                                    return Center(
                                                      child: Container(
                                                        width: 180,
                                                        height: 150,
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color:
                                                                Colors.orange,
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
                                                    allDocs[index]['imageUrl']),
                                              ), //Done
                                              //Pyramids
                                              Positioned(
                                                top: 65,
                                                right: isArabic() ? 15 : null,
                                                left: isArabic() ? null : 15,
                                                child: BorderedText(
                                                  strokeColor: Colors.black,
                                                  strokeWidth: 2,
                                                  strokeCap: StrokeCap.butt,
                                                  strokeJoin: StrokeJoin.bevel,
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
    );
  }
}
