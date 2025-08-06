import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/churchs/domain/entities/church_entity.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/default_read_more.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
import '../../../../../core/utils/widgets/opening_hours_item.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/church_cubit.dart';

class ChurchDetailsViewBody extends StatelessWidget {
  const ChurchDetailsViewBody({
    super.key,
    required this.churchEntity,
  });

  final ChurchEntity churchEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChurchCubit, ChurchState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              //image
              DefaultServiceDetailsImage(
                entity: churchEntity,
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
                              ? churchEntity.addressArabic
                              : churchEntity.address,
                          mapUrl: churchEntity.mapUrl,
                          rate: churchEntity.rate,
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Opening hours
                        OpeningHoursWidget(
                          openFrom: isArabic()
                              ? churchEntity.openingHoursArabic['from']
                              : churchEntity.openingHours['from'],
                          openTo: isArabic()
                              ? churchEntity.openingHoursArabic['to']
                              : churchEntity.openingHours['to'],
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Description and rate
                        HeadText(
                          text: S.of(context).Description,
                        ),
                        kSizedBox,
                        ReadMoreWidget(
                          text: isArabic()
                              ? churchEntity.descriptionArabic
                              : churchEntity.description,
                        ),
                        kSizedBox,

                        //-------------------------------------------------------------------------
                        //Gallery
                        GalleryWidget(entity: churchEntity),
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
