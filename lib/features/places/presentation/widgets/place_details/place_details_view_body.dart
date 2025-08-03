import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/location_widget.dart';
import 'package:your_tour_guide/core/utils/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/place_details/transport_widget.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/features/tours/data/models/tour_model.dart';
import 'package:your_tour_guide/core/utils/widgets/default_read_more.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart'
    show GalleryWidget;
import '../../../../../core/utils/widgets/place/how_to_go_widget.dart';
import '../../../../../core/utils/widgets/tickets_widget.dart';
import '../../../domian/entities/place_entity.dart';
import '../../cubit/place_cubit/place_cubit.dart';
import 'nearly_services_list_view.dart';

class PlaceDetailsViewBody extends StatelessWidget {
  const PlaceDetailsViewBody({super.key, required this.placeEntity});

  final PlaceEntity placeEntity;
  static final String id = 'place_details';
  @override
  Widget build(BuildContext context) {
    CollectionReference tour = FirebaseFirestore.instance.collection('tours');
    return BlocBuilder<PlaceCubit, PlaceState>(
      builder: (context, state) {
        var placeCubit = PlaceCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              DefaultServiceDetailsImage(
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
                    OpeningHoursWidget(
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
                    HeadText(text: S.of(context).Description),
                    kSizedBox,
                    ReadMoreWidget(
                      text: isArabic()
                          ? placeEntity.descriptionArabic
                          : placeEntity.description,
                    ),
                    kSizedBox,
                    Divider(
                      height: 0.5,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Metro
                    placeEntity.transport['metro'] == '' ||
                            placeEntity.transportArabic['metro'] == ''
                        ? Container(width: 0, height: 0)
                        : HowToGoWidget(placeEntity: placeEntity),
                    //-------------------------------------------------------------------
                    //Transport
                    kSizedBox,
                    placeEntity.transport['transport'].length == 0 ||
                            placeEntity.transportArabic['transport'].length == 0
                        ? Container(width: 0, height: 0)
                        : TransportWidget(placeEntity: placeEntity),
                    //-------------------------------------------------------------------
                    //Gallery
                    GalleryWidget(entity: placeEntity),
                    //-------------------------------------------------------------------
                    //Nearly
                    HeadText(text: S.of(context).nearly),
                    kSizedBox,
                    NearlyServicesListView(),
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Tour
                    placeEntity.includeTour == true
                        ? HeadText(text: S.of(context).toursToPlace)
                        : Container(),
                    placeEntity.includeTour == true
                        ? SizedBox(height: 5)
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
                                }

                                return SizedBox(
                                  height: 100,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {},
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
                    SizedBox(height: 10),

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
