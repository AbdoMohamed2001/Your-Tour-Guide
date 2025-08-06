import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';
import 'package:your_tour_guide/features/cafes/presentation/cubit/cafe_cubit.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/contact_widget.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
import '../../../../../core/utils/widgets/opening_hours_item.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart';
import '../../../../../generated/l10n.dart';

class CafeDetailsViewBody extends StatelessWidget {
  const CafeDetailsViewBody({
    super.key,
    required this.cafeEntity,
  });

  final CafeEntity cafeEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CafeCubit, CafeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              //image
              DefaultServiceDetailsImage(
                entity: cafeEntity,
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
                              ? cafeEntity.addressArabic
                              : cafeEntity.address,
                          mapUrl: cafeEntity.mapUrl,
                          rate: cafeEntity.rate,
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Opening hours
                        OpeningHoursWidget(
                          openFrom: isArabic()
                              ? cafeEntity.openingHoursArabic['from']
                              : cafeEntity.openingHours['from'],
                          openTo: isArabic()
                              ? cafeEntity.openingHoursArabic['to']
                              : cafeEntity.openingHours['to'],
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //contact
                        HeadText(text: S.of(context).Contact),
                        kSizedBox,
                        // Contact website and phone number
                        ContactWidget(entity: cafeEntity),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Gallery
                        GalleryWidget(entity: cafeEntity),
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
