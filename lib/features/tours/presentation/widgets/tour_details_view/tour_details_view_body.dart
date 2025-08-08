import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_button.dart';
import 'package:your_tour_guide/core/utils/widgets/tours/inclusions_widget.dart';
import 'package:your_tour_guide/features/tours/presentation/cubit/tour_cubit.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tour_details_view/tour_details_widget.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tour_details_view/tour_itinerary_widget.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tour_details_view/tour_location_widget.dart';
import 'package:your_tour_guide/features/tours/presentation/widgets/tour_details_view/tour_organizer_widget.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/contact_widget.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/default_read_more.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entities/tour_entity.dart';

class TourDetailsViewBody extends StatelessWidget {
  const TourDetailsViewBody({super.key, required this.tourEntity});

  final TourEntity tourEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TourCubit, TourState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              DefaultServiceDetailsImage(entity: tourEntity),
              kSizedBox,
              //-------------------------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-------------------------------------------------------------------
                    //Tour Details
                    TourDetailsWidget(tourEntity: tourEntity),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Tour location
                    TourLocationWidget(tourEntity: tourEntity),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Tour Itinerary
                    HeadText(text: S.of(context).tourItinerary),
                    kSizedBox,
                    TourItineraryWidget(tourEntity: tourEntity),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Description and rate
                    HeadText(text: S.of(context).Description),
                    kSizedBox,
                    ReadMoreWidget(
                      text: isArabic()
                          ? tourEntity.descriptionArabic
                          : tourEntity.description,
                    ),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //InclusionsWidget
                    HeadText(text: S.of(context).inclusions),
                    kSizedBox,
                    InclusionsWidget(eventEntity: tourEntity),
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //exclusions
                    HeadText(text: S.of(context).exclusions),
                    kSizedBox,
                    InclusionsWidget(
                      eventEntity: tourEntity,
                      isInclusion: false,
                    ),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    TourOrganizerWidget(tourEntity: tourEntity),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Contact
                    HeadText(text: S.of(context).Contact),
                    kSizedBox,
                    ContactWidget(entity: tourEntity),
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Gallery
                    HeadText(text: S.of(context).Gallery),
                    kSizedBox,
                    GalleryWidget(entity: tourEntity),
                    //-------------------------------------------------------------------
                    //Booking
                    kSizedBox,
                    CustomButton(
                      onTap: () async {
                        var url = Uri.parse(tourEntity.booking);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                        ;
                      },
                      text: S.of(context).bookingTour.toUpperCase(),
                    ),
                    // BookingWidget(tourEntity: tourEntity),
                    kSizedBox,
                  ],
                ),
              ),
              //-------------------------------------------------------------------
            ],
          ),
        );
      },
    );
  }
}
