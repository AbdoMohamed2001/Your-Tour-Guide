import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/tour_model.dart';
import 'package:your_tour_guide/widgets/default_read_more.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/hotel/contact_widget.dart';
import 'package:your_tour_guide/widgets/inclusions_widget_tour.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:your_tour_guide/widgets/place/custom_place_image.dart';
import 'package:your_tour_guide/widgets/place/gallery_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/utils.dart';

class TourScreenNeew extends StatelessWidget {
  TourScreenNeew({
    Key? key,
    required this.placeModel,
    required this.docID,
  }) : super(key: key);

  final TourModel placeModel;
  final docID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit()
        ..likedKey = docID
        ..restorePersistedPref(),
      child: Scaffold(
        appBar: NoneAppBar(),
        body: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var placeCubit = PlaceCubit.get(context);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPlaceImage(
                      fontSize: placeModel.nameArabic!.length >= 25 ||
                              placeModel.name!.length >= 25
                          ? 19
                          : 24,
                      docID: docID,
                      imageUrl: placeModel.imageUrl,
                      name:
                          isArabic() ? placeModel.nameArabic : placeModel.name,
                      cityName: '',
                      // cityName: isArabic()
                      //     ? placeModel.tourLocationArabic
                      //     : placeModel.tourLocation,
                      containerImage: placeModel.images![0],
                      cubitLikedValue: placeCubit.likedValue,
                      favouriteFunction: () {
                        placeCubit.changeLike();
                        if (placeCubit.likedValue == true) {
                          CacheData.setData(
                              key: placeCubit.likedKey,
                              value: placeCubit.likedValue);
                          placeCubit.addTourToFavourite(
                            tourModel: placeModel,
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
                    kSizedBox,
                    //-------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //-------------------------------------------------------------------
                          //Tour Details
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BuildTourRow(
                                head: S.of(context).Price,
                                text: placeModel.startPrice!,
                              ),
                              BuildTourRow(
                                head: S.of(context).Duration,
                                text: isArabic()
                                    ? placeModel.durationArabic!
                                    : placeModel.duration!,
                              ),
                              BuildTourRow(
                                head: S.of(context).tourAvailability,
                                text: isArabic()
                                    ? placeModel.tourAvailabilityArabic!
                                    : placeModel.tourAvailability!,
                              ),
                              // BuildTourRow(
                              //   head: S.of(context).TourType,
                              //   text: isArabic()
                              //       ? placeModel.tourTypeArabic!
                              //       : placeModel.tourType!,
                              // ),
                              BuildTourRow(
                                head: S.of(context).PickFrom,
                                text: isArabic()
                                    ? placeModel.pickupFromArabic!
                                    : placeModel.pickupFrom!,
                              ),
                            ],
                          ),
                          kSizedBox,
                          //-------------------------------------------------------------------
                          //tour location
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadText(text: 'موقع الرحله '),
                              kSmallSizedBox,
                              Text(
                                isArabic()
                                    ? placeModel.tourLocationArabic!
                                    : placeModel.tourLocation!,
                              ),
                            ],
                          ),
                          kSizedBox,
                          //-------------------------------------------------------------------
                          //Tour Itinerary
                          HeadText(
                            text: S.of(context).tourItinerary,
                          ),
                          kSmallSizedBox,
                          SizedBox(
                            height: 80,
                            child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  BuildItineraryWidget(
                                placeModel: placeModel,
                                index: index,
                              ),
                              itemCount: placeModel.tourItinerary!.length,
                              separatorBuilder: (_, index) => Container(
                                alignment: Alignment.center,
                                width: 40,
                                child: Text('---->'),
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          kSizedBox,
                          //-------------------------------------------------------------------
                          //Description and rate
                          HeadText(text: S.of(context).Description),
                          kSmallSizedBox,
                          DefaultReadMoreWidget(
                            text: isArabic()
                                ? placeModel.descriptionArabic!
                                : placeModel.description!,
                          ),
                          kSizedBox,
                          //-------------------------------------------------------------------
                          //Inclusions
                          HeadText(text: S.of(context).inclusions),
                          kSmallSizedBox,
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => InclusionsWidgetTour(
                              icon: Icons.done,
                              index: index,
                              tourModel: placeModel,
                              exclusionsOrInclusion: isArabic()
                                  ? placeModel.inclusionsArabic
                                  : placeModel.inclusions,
                              iconColor: Colors.green,
                            ),
                            separatorBuilder: (_, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: placeModel.inclusions!.length,
                          ),
                          kSizedBox,
                          //-------------------------------------------------------------------
                          //exclusions
                          HeadText(text: S.of(context).exclusions),
                          kSmallSizedBox,
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => InclusionsWidgetTour(
                              icon: Icons.close,
                              index: index,
                              tourModel: placeModel,
                              exclusionsOrInclusion: isArabic()
                                  ? placeModel.exclusionsArabic
                                  : placeModel.exclusions,
                              iconColor: Colors.red,
                            ),
                            separatorBuilder: (_, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: placeModel.exclusions!.length,
                          ),
                          kSizedBox,
                          //-------------------------------------------------------------------
                          //Contact
                          Row(
                            children: [
                              HeadText(text: S.of(context).tourOrganizer),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Image.network(
                                  placeModel.tripOrganizerLogo!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                isArabic()
                                    ? placeModel.tripOrganizerArabic!
                                        .replaceAll('_b', '\n')
                                    : placeModel.tripOrganizer!
                                        .replaceAll('_b', '\n'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          kSizedBox,
                          //-------------------------------------------------------------------
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              S.of(context).Contact,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          kSmallSizedBox,
                          ContactWidget(model: placeModel, cubit: placeCubit),
                          kSizedBox,
                          //-------------------------------------------------------------------
                          //Gallery
                          GalleryWidget(cubit: placeCubit, model: placeModel),
                          //-------------------------------------------------------------------
                          //Booking
                          kSizedBox,
                          GestureDetector(
                            onTap: () async {
                              var url = Uri.parse(placeModel.booking!);
                              if (await canLaunchUrl(
                                url,
                              )) {
                                await launchUrl(url);
                              }
                              ;
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.orange[300],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'ارسل طلب لحجز لهذه الرحله ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          kSizedBox,
                        ],
                      ),
                    ),
                    //-------------------------------------------------------------------
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BuildTourRow extends StatelessWidget {
  const BuildTourRow({super.key, required this.head, required this.text});

  final String head;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          head,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(text),
      ],
    );
  }
}

class BuildItineraryWidget extends StatelessWidget {
  const BuildItineraryWidget({
    super.key,
    required this.placeModel,
    required this.index,
  });

  final TourModel placeModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage:
              NetworkImage(placeModel.tourItinerary![index]['imageUrl']),
          radius: 50,
        ),
        SizedBox(
          width: 5,
        ),
        Text(isArabic()
            ? placeModel.tourItinerary![index]['nameArabic']
                .replaceAll('_b', '\n')
            : placeModel.tourItinerary![index]['name'].replaceAll('_b', '\n')),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
