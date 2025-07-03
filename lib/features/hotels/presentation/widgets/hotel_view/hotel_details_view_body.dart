import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:your_tour_guide/generated/assets.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/contact_widget.dart';
import '../../../../../core/utils/widgets/default_read_more.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
import '../../../../../core/utils/widgets/place/custom_place_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/hotel_entity.dart';
import '../room_view/room_widget.dart';
import 'hotel_features_list_view.dart';
import 'no_of_rooms_widget.dart';

class HotelDetailsViewBody extends StatelessWidget {
  const HotelDetailsViewBody({
    super.key,
    required this.hotelEntity,
  });

  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              //image
              CustomPlaceImage(
                cubitDataKeyCurrentContext: GlobalKey(),
                entity: hotelEntity,
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
                              ? hotelEntity.addressArabic
                              : hotelEntity.address,
                          mapUrl: hotelEntity.mapUrl,
                          rate: hotelEntity.rate,
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //about
                        HeadText(text: S.of(context).about),
                        kSizedBox,
                        ReadMoreWidget(
                          text: isArabic()
                              ? hotelEntity.aboutArabic
                              : hotelEntity.about,
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //noOfRooms
                        NoOfRoomsWidget(hotelEntity: hotelEntity),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Features
                        HeadText(text: S.of(context).Features),
                        kSizedBox,
                        HotelFeaturesListView(hotelEntity: hotelEntity),
                        // booking
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                //change later
                                var url = Uri.parse(hotelEntity.mapUrl);
                                if (await canLaunchUrl(
                                  url,
                                )) {
                                  await launchUrl(url);
                                }
                                ;
                              },
                              child: Container(
                                width: 120,
                                height: 60,
                                color: Theme.of(context).primaryColorDark,
                                child: Image.asset(Assets.imagesBooking),
                              ),
                            ),
                          ],
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Rooms
                        HeadText(text: S.of(context).rooms),
                        kSizedBox,
                        hotelEntity.roomsArabic.length == 0 &&
                                hotelEntity.rooms.length == 0
                            ? Container(width: 0, height: 0)
                            : RoomListView(hotelEntity: hotelEntity),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //contact
                        HeadText(text: S.of(context).Contact),
                        kSizedBox,
                        // Contact website and phone number
                        ContactWidget(entity: hotelEntity),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Gallery
                        GalleryWidget(entity: hotelEntity),
                        kSizedBox,
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
