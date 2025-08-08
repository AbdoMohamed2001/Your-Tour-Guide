import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/features/cinemas/domain/entities/cinema_entity.dart';
import 'package:your_tour_guide/features/cinemas/presentation/cubit/cinema_cubit.dart';
import 'package:your_tour_guide/features/cinemas/presentation/widgets/cinema_details_view/movie_widget.dart';
import 'package:your_tour_guide/generated/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
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
              DefaultServiceDetailsImage(entity: cinemaEntity),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSizedBox,
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
                    //Currently Showing
                    Center(
                        child: HeadText(text: S.of(context).currentlyShowing)),
                    kSizedBox,
                    SizedBox(
                      height: 285,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => MovieWidget(
                          movie: isArabic()
                              ? cinemaEntity.filmsArabic[index]
                              : cinemaEntity.films[index],
                        ),
                        separatorBuilder: (_, index) => SizedBox(width: 4),
                        itemCount: cinemaEntity.films.length,
                      ),
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Tickets
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              Assets.imagesTickets,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 4),
                            Padding(
                              padding: isArabic()
                                  ? const EdgeInsets.only(right: 0, left: 25)
                                  : const EdgeInsets.only(right: 0, left: 20),
                              child: Text(
                                S.of(context).Tickets,
                                textAlign: TextAlign.center,
                                style: TextStyles.bold18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            isArabic()
                                ? '( 120 / 130 / 150 / 250 VIP ) جنيه'
                                : '( 120 / 130 / 150 / 250 VIP ) EGP',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyles.bold16,
                          ),
                        ),
                      ],
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Gallery
                    HeadText(text: S.of(context).Gallery),
                    kSizedBox,
                    GalleryWidget(entity: cinemaEntity),
                    kSizedBox,
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
