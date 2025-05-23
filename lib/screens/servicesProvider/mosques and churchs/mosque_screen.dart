// ignore_for_file: missing_required_param
import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/mosque_model.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/default_read_more.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/location_widget.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:your_tour_guide/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/widgets/place/custom_place_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/place/gallery_widget.dart';

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
      create: (context) => PlaceCubit()
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
                    docID: docID,
                    imageUrl: mosqueModel.imageUrl,
                    name:
                        isArabic() ? mosqueModel.nameArabic : mosqueModel.name,
                    cityName: isArabic()
                        ? mosqueModel.cityNameArabic
                        : mosqueModel.cityName,
                    containerImage: mosqueModel.images![0],
                    cubitLikedValue: mosqueCubit.likedValue,
                    favouriteFunction: () {
                      mosqueCubit.changeLike();
                      if (mosqueCubit.likedValue == true) {
                        CacheData.setData(
                            key: mosqueCubit.likedKey,
                            value: mosqueCubit.likedValue);
                        mosqueCubit.addMosqueToFavourite(
                          collectionName: collectionName,
                          mosqueModel: mosqueModel,
                          docID: docID,
                          context: context,
                        );
                      } else {
                        CacheData.setData(
                            key: mosqueCubit.likedKey,
                            value: mosqueCubit.likedValue);
                        mosqueCubit.deleteFromFavourite(
                          context: context,
                          docID: docID,
                        );
                      }
                    },
                    cubitDataKeyCurrentContext:
                        mosqueCubit.dataKey.currentContext,
                    images: mosqueModel.images!,
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
                          englishAddress: mosqueModel.address,
                          mapUrl: mosqueModel.mapUrl,
                          rate: mosqueModel.rate,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //-------------------------------------------------------------------------
                        //Opening hours
                        BuildOpeningHoursItem(
                          openFrom: isArabic()
                              ? mosqueModel.openingHoursArabic!['from']
                              : mosqueModel.openingHours!['from'],
                          openTo: isArabic()
                              ? mosqueModel.openingHoursArabic!['to']
                              : mosqueModel.openingHours!['to'],
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
                          child: DefaultReadMoreWidget(
                            text: isArabic()
                                ? mosqueModel.descriptionArabic!
                                : mosqueModel.description!,
                          ),
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Images

                        GalleryWidget(
                          model: mosqueModel,
                          cubit: mosqueCubit,
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
