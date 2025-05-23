// ignore_for_file: missing_required_param
import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/widgets/feature_item.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/default_read_more.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/hotel/contact_widget.dart';
import 'package:your_tour_guide/widgets/hotel/room_widget.dart';
import 'package:your_tour_guide/widgets/location_widget.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:your_tour_guide/widgets/place/custom_place_image.dart';
import 'package:your_tour_guide/widgets/place/gallery_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelScreen extends StatelessWidget {
  HotelScreen({
    Key? key,
    required this.hotelModel,
    required this.docID,
  }) : super(key: key);
  static String id = 'hotelScreen';
  final HotelModel hotelModel;
  final docID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit()
        ..likedKey = docID
        ..restorePersistedPref()
        ..canLaunchUrlFunction(),
      child: Scaffold(
        body: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var hotelCubit = PlaceCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  //image
                  CustomPlaceImage(
                    docID: docID,
                    imageUrl: hotelModel.imageUrl,
                    name: isArabic() ? hotelModel.nameArabic : hotelModel.name,
                    cityName: isArabic()
                        ? hotelModel.cityNameArabic
                        : hotelModel.cityName,
                    containerImage: hotelModel.images![0],
                    cubitLikedValue: hotelCubit.likedValue,
                    favouriteFunction: () {
                      hotelCubit.changeLike();
                      if (hotelCubit.likedValue == true) {
                        CacheData.setData(
                            key: hotelCubit.likedKey,
                            value: hotelCubit.likedValue);
                        hotelCubit.addHotelToFavourite(
                          hotelModel: hotelModel,
                          docID: docID,
                          context: context,
                        );
                      } else {
                        CacheData.setData(
                            key: hotelCubit.likedKey,
                            value: hotelCubit.likedValue);
                        hotelCubit.deleteFromFavourite(
                          context: context,
                          docID: docID,
                        );
                      }
                    },
                    cubitDataKeyCurrentContext:
                        hotelCubit.dataKey.currentContext,
                    images: hotelModel.images!,
                  ),
                  Column(
                    children: [
                      //-------------------------------------------------------------------------
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kSizedBox,
                            //-------------------------------------------------------------------------
                            //Location and google map
                            LocationWidget(
                              address: isArabic()
                                  ? hotelModel.addressArabic
                                  : hotelModel.address,
                              englishAddress: hotelModel.address,
                              mapUrl: hotelModel.mapUrl,
                              rate: hotelModel.rate,
                            ),
                            kSizedBox,
                            //-------------------------------------------------------------------------
                            //about
                            // HeadText(text: S.of(context).about),
                            DefaultReadMoreWidget(
                              text: isArabic()
                                  ? hotelModel.aboutArabic!
                                  : hotelModel.about!,
                            ),
                            kSizedBox,
                            //-------------------------------------------------------------------------
                            //noOfRooms
                            Row(
                              children: [
                                Row(
                                  children: [
                                    hotelModel.noOfFloors == 0
                                        ? Container()
                                        : Text(
                                            'عدد الطوابق : ${hotelModel.noOfFloors}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                    hotelModel.noOfFloors == 0
                                        ? Container()
                                        : SizedBox(
                                            width: 8,
                                          ),
                                    Text(
                                      'عدد الغرف : ${hotelModel.noOfRooms}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(),
                              ],
                            ),
                            kSizedBox,
                            //-------------------------------------------------------------------------
                            //Features
                            HeadText(text: S.of(context).Features),
                            kSizedBox,
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    BuildFeatureItem(
                                  index: index,
                                  hotelModel: hotelModel,
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 5,
                                ),
                                itemCount: hotelModel.features!.length,
                              ),
                            ),
                            //booking
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () async {
                            //         //change later
                            //         var url = Uri.parse(hotelModel.mapUrl!);
                            //         if (await canLaunchUrl(
                            //           url,
                            //         )) {
                            //           await launchUrl(url);
                            //         }
                            //         ;
                            //       },
                            //       child: Container(
                            //         width: 120,
                            //         height: 60,
                            //         color: Theme.of(context).primaryColorDark,
                            //         child: Image.asset('assets/images/booking.png'),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            kSizedBox,
                            //-------------------------------------------------------------------------
                            //Rooms
                            HeadText(text: S.of(context).rooms),
                            kSizedBox,
                            hotelModel.roomsArabic!.length == 0 &&
                                    hotelModel.rooms!.length == 0
                                ? Container(
                                    width: 0,
                                    height: 0,
                                  )
                                : RoomWidget(hotelModel: hotelModel),
                            kSizedBox,
                            //-------------------------------------------------------------------------
                            //contact
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: HeadText(text: S.of(context).Contact),
                            ),
                            kSizedBox,
                            //Contact website and phone number
                            ContactWidget(model: hotelModel, cubit: hotelCubit),
                            kSizedBox,
                            //-------------------------------------------------------------------------
                            //Gallery
                            GalleryWidget(cubit: hotelCubit, model: hotelModel),
                          ],
                        ),
                      ),
                    ],
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

//GridView.builder(
//                         physics: BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 30,
//                         ),
//                         itemBuilder: (context, index) => BuildFeatureItem(
//                           index: index,
//                           hotelModel: hotelModel,
//                         ),
//                         itemCount: hotelModel.features!.length,
//                       ),
