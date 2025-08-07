import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/restaurants/domain/entities/restaurant_entity.dart';
import 'package:your_tour_guide/features/restaurants/presentation/cubit/restaurant_cubit.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/combined_text.dart';
import '../../../../../core/utils/widgets/contact_widget.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
import '../../../../../core/utils/widgets/menu/menu_view.dart';
import '../../../../../core/utils/widgets/opening_hours_item.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class RestaurantDetailsViewBody extends StatelessWidget {
  const RestaurantDetailsViewBody({
    super.key,
    required this.restEntity,
  });

  final RestaurantEntity restEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              //image
              DefaultServiceDetailsImage(
                entity: restEntity,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Location and google map
                    LocationWidget(
                      address: isArabic()
                          ? restEntity.addressArabic
                          : restEntity.address,
                      mapUrl: restEntity.mapUrl,
                      rate: restEntity.rate,
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Opening hours
                    OpeningHoursWidget(
                      openFrom: isArabic()
                          ? restEntity.openingHoursArabic['from']
                          : restEntity.openingHours['from'],
                      openTo: isArabic()
                          ? restEntity.openingHoursArabic['to']
                          : restEntity.openingHours['to'],
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //MENU
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesMenu,
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(width: 12),
                        CombinedText(
                          firstText: 'See the full menu: ',
                          secondText: 'MENU',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MenuView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //contact
                    HeadText(text: S.of(context).Contact),
                    kSizedBox,
                    // Contact website and phone number
                    ContactWidget(entity: restEntity),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Gallery
                    HeadText(text: S.of(context).Gallery),
                    kSizedBox,
                    GalleryWidget(entity: restEntity),
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
