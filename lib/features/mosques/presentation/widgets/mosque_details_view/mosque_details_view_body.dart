import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/mosques/domain/entities/mosque_entity.dart';
import 'package:your_tour_guide/features/mosques/presentation/cubit/mosque_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/default_read_more.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
import '../../../../../core/utils/widgets/opening_hours_item.dart';
import '../../../../../core/utils/widgets/place/custom_place_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart';
import '../../../../../generated/l10n.dart';

class MosqueDetailsViewBody extends StatelessWidget {
  const MosqueDetailsViewBody({
    super.key,
    required this.mosqueEntity,
  });

  final MosqueEntity mosqueEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MosqueCubit, MosqueState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              //image
              CustomPlaceImage(
                cubitDataKeyCurrentContext: GlobalKey(),
                entity: mosqueEntity,
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
                              ? mosqueEntity.addressArabic
                              : mosqueEntity.address,
                          mapUrl: mosqueEntity.mapUrl,
                          rate: mosqueEntity.rate,
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Opening hours
                        OpeningHoursWidget(
                          openFrom: isArabic()
                              ? mosqueEntity.openingHoursArabic['from']
                              : mosqueEntity.openingHours['from'],
                          openTo: isArabic()
                              ? mosqueEntity.openingHoursArabic['to']
                              : mosqueEntity.openingHours['to'],
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
                              ? mosqueEntity.descriptionArabic
                              : mosqueEntity.description,
                        ),
                        kSizedBox,

                        //-------------------------------------------------------------------------
                        //Gallery
                        GalleryWidget(entity: mosqueEntity),
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
