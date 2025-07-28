import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cinemas/domain/entities/cinema_entity.dart';
import 'package:your_tour_guide/features/cinemas/presentation/cubit/cinema_cubit.dart';
import 'package:your_tour_guide/features/cinemas/presentation/widgets/cinema_details_view/movie_widget.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
import '../../../../../core/utils/widgets/opening_hours_item.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart';
import '../../../../../generated/l10n.dart';

class CinemaDetailsViewBody extends StatelessWidget {
  const CinemaDetailsViewBody({
    super.key,
    required this.cinemaEntity,
  });

  final CinemaEntity cinemaEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CinemaCubit, CinemaState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              //image
              DefaultServiceDetailsImage(
                cubitDataKeyCurrentContext: GlobalKey(),
                entity: cinemaEntity,
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
                              ? cinemaEntity.addressArabic
                              : cinemaEntity.address,
                          mapUrl: cinemaEntity.mapUrl,
                          rate: cinemaEntity.rate,
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Opening hours
                        OpeningHoursWidget(
                          openFrom: isArabic()
                              ? cinemaEntity.openingHoursArabic['from']
                              : cinemaEntity.openingHours['from'],
                          openTo: isArabic()
                              ? cinemaEntity.openingHoursArabic['to']
                              : cinemaEntity.openingHours['to'],
                        ),
                        kSizedBox,
                        //Films
                        HeadText(text: S.of(context).films),
                        kSizedBox,
                        SizedBox(
                          height: 300,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) => MovieWidget(
                              cinemaEntity: cinemaEntity,
                              index: index,
                            ),
                            separatorBuilder: (_, index) => SizedBox(
                              width: 4,
                            ),
                            itemCount: cinemaEntity.films.length,
                          ),
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Description and rate
                        HeadText(
                          text: S.of(context).Description,
                        ),
                        kSizedBox,
                        kSizedBox,
                        //-------------------------------------------------------------------
                        //-------------------------------------------------------------------------
                        //Images
                        //-------------------------------------------------------------------------
                        //Gallery
                        GalleryWidget(entity: cinemaEntity),
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
