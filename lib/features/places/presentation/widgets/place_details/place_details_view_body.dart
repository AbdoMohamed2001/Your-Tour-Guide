import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/location_widget.dart';
import 'package:your_tour_guide/core/utils/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/place_details/tours_list_view.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/place_details/transport_widget.dart';
import 'package:your_tour_guide/features/tours/domain/usecases/get_tours_usecase.dart';
import 'package:your_tour_guide/features/tours/presentation/cubit/tour_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/utils/widgets/default_read_more.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart'
    show GalleryWidget;
import '../../../../../core/utils/widgets/place/how_to_go_widget.dart';
import '../../../../../core/utils/widgets/tickets_widget.dart';
import 'package:your_tour_guide/features/places/domain/entities/place_entity.dart';
import '../../cubit/place_cubit/place_cubit.dart';
import 'nearly_services_list_view.dart';

class PlaceDetailsViewBody extends StatelessWidget {
  const PlaceDetailsViewBody({super.key, required this.placeEntity});

  final PlaceEntity placeEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceCubit, PlaceState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              DefaultServiceDetailsImage(entity: placeEntity),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //LOCATION
                    LocationWidget(
                      address: isArabic()
                          ? placeEntity.addressArabic
                          : placeEntity.address,
                      mapUrl: placeEntity.mapUrl,
                      rate: placeEntity.rate,
                    ),
                    //-------------------------------------------------------------------
                    //OPENING HOURS
                    kSizedBox,
                    OpeningHoursWidget(
                      openFrom: isArabic()
                          ? placeEntity.openingHoursArabic['from']
                          : placeEntity.openingHours['from'],
                      openTo: isArabic()
                          ? placeEntity.openingHoursArabic['to']
                          : placeEntity.openingHours['to'],
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //TICKETS
                    TicketsWidget(model: placeEntity),
                    kSizedBox,
                    const Divider(
                      height: 0.5,
                      thickness: 1,
                      color: Color(0xffcccccc),
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //DESCRIPTION
                    HeadText(text: S.of(context).Description),
                    kSizedBox,
                    ReadMoreWidget(
                      text: isArabic()
                          ? placeEntity.descriptionArabic
                          : placeEntity.description,
                    ),
                    //-------------------------------------------------------------------
                    //METRO
                    placeEntity.transport['metro'] == '' ||
                            placeEntity.transportArabic['metro'] == ''
                        ? Container(width: 0, height: 0)
                        : HowToGoWidget(placeEntity: placeEntity),
                    //-------------------------------------------------------------------
                    //TRANSPORT
                    placeEntity.transport['transport'].length == 0 ||
                            placeEntity.transportArabic['transport'].length == 0
                        ? Container()
                        : kSizedBox,
                    placeEntity.transport['transport'].length == 0 ||
                            placeEntity.transportArabic['transport'].length == 0
                        ? Container(width: 0, height: 0)
                        : TransportWidget(placeEntity: placeEntity),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Gallery
                    HeadText(text: S.of(context).Gallery),
                    kSizedBox,
                    GalleryWidget(entity: placeEntity),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Nearly
                    HeadText(text: S.of(context).nearly),
                    kSizedBox,
                    NearlyServicesListView(cityName: placeEntity.cityName),
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Tour
                    placeEntity.includeTour == true
                        ? HeadText(text: S.of(context).toursToPlace)
                        : Container(),
                    placeEntity.includeTour == true ? kSizedBox : Container(),
                    placeEntity.includeTour == true
                        ? BlocProvider(
                            create: (context) =>
                                TourCubit(getIt<GetToursUseCase>()),
                            child: ToursListView(placeDocId: placeEntity.docId),
                          )
                        : Container(),
                    kSizedBox,
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
