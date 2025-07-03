// ignore_for_file: missing_required_param
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/location_widget.dart';
import 'package:your_tour_guide/core/utils/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/core/utils/widgets/place/custom_place_image.dart';
import 'package:your_tour_guide/core/utils/widgets/place/gallery_widget.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/mosque_model.dart';
import 'package:your_tour_guide/core/utils/widgets/default_read_more.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/places/data/repos/places_repo.dart';
import '../../../core/services/get_it_services_locator.dart';
import '../../../features/places/presentation/cubit/place_cubit/place_cubit.dart';

class MosqueScreen extends StatelessWidget {
  MosqueScreen({
    Key? key,
    required this.mosqueModel,
    required this.docID,
    required this.collectionName,
  }) : super(key: key);

  final MosqueModel mosqueModel;
  final docID;
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit(getIt<PlacesRepo>())
        ..likedKey = docID
        ..restorePersistedPref(),
      child: Scaffold(
        body: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var mosqueCubit = PlaceCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomPlaceImage(
                    cubitDataKeyCurrentContext:
                        mosqueCubit.dataKey.currentContext,
                    entity: mosqueModel,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //------------------------------------------------------------------------
                        kSizedBox,
                        //------------------------------------------------------------------------
                        //location and googleMaps
                        LocationWidget(
                          address: isArabic()
                              ? mosqueModel.addressArabic
                              : mosqueModel.address,
                          mapUrl: mosqueModel.mapUrl,
                          rate: mosqueModel.rate,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //-------------------------------------------------------------------------
                        //Opening hours
                        OpeningHoursWidget(
                          openFrom: isArabic()
                              ? mosqueModel.openingHoursArabic['from']
                              : mosqueModel.openingHours['from'],
                          openTo: isArabic()
                              ? mosqueModel.openingHoursArabic['to']
                              : mosqueModel.openingHours['to'],
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------
                        //Description and rate
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadText(
                                text: S.of(context).Description,
                              ),
                            ],
                          ),
                        ),
                        kSizedBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ReadMoreWidget(
                            text: isArabic()
                                ? mosqueModel.descriptionArabic
                                : mosqueModel.description,
                          ),
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Images

                        GalleryWidget(
                          entity: mosqueModel,
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
