import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:your_tour_guide/generated/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/contact_widget.dart';
import '../../../../../core/utils/widgets/default_read_more.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
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
              DefaultServiceDetailsImage(entity: hotelEntity),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Hotel Icon
                        Column(
                          children: [
                            Image.asset(
                              Assets.imagesHotelStars,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: isArabic()
                                  ? const EdgeInsets.only(left: 5)
                                  : const EdgeInsets.only(right: 5),
                              child: Text(
                                S.of(context).stars,
                                textAlign: TextAlign.center,
                                style: TextStyles.bold18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 40),
                        //Hotel Stars
                        RatingBar(
                          initialRating: hotelEntity.stars.toDouble(),
                          ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            half: Icon(
                              Icons.star_half,
                              color: Colors.orange,
                            ),
                            empty: SizedBox(),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    kSizedBox,
                    //noOfRooms
                    NoOfRoomsWidget(hotelEntity: hotelEntity),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
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

                    //-------------------------------------------------------------------------
                    //Features
                    HeadText(text: S.of(context).Features),
                    kSizedBox,
                    HotelFeaturesListView(hotelEntity: hotelEntity),
                    // booking
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     GestureDetector(
                    //       onTap: () async {
                    //         //change later
                    //         var url = Uri.parse(hotelEntity.mapUrl);
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
                    //         child: Image.asset(Assets.imagesBooking),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Rooms
                    HeadText(text: S.of(context).rooms),
                    kSizedBox,
                    hotelEntity.roomsArabic.length == 0 &&
                            hotelEntity.rooms.length == 0
                        ? const SizedBox()
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
                    HeadText(text: S.of(context).Gallery),
                    kSizedBox,
                    GalleryWidget(entity: hotelEntity),
                    kSizedBox
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
