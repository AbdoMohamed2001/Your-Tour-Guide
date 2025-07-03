// ignore_for_file: missing_required_param

import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/widgets/location_widget.dart';
import 'package:your_tour_guide/core/utils/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/core/utils/widgets/place/custom_place_image.dart';
import 'package:your_tour_guide/core/utils/widgets/place/gallery_widget.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/mall_model.dart';
import 'package:your_tour_guide/screens/servicesProvider/malls,%20mosques%20and%20churchs/store_screen.dart';
import 'package:your_tour_guide/core/utils/widgets/default_read_more.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/places/data/repos/places_repo.dart';
import '../../../core/services/get_it_services_locator.dart';
import '../../../features/places/presentation/cubit/place_cubit/place_cubit.dart';

class MallNewScreen extends StatelessWidget {
  MallNewScreen({
    Key? key,
    required this.mallModel,
    required this.docID,
    required this.collectionName,
  }) : super(key: key);

  final MallModel mallModel;
  final docID;
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    final listOfStores = [
      'https://static.vecteezy.com/system/resources/previews/024/131/445/original/zara-brand-logo-white-symbol-clothes-design-icon-abstract-illustration-with-black-background-free-vector.jpg',
      'https://thumbs.dreamstime.com/b/hm-h-m-logo-editorial-illustrative-white-background-icon-vector-logos-icons-set-social-media-flat-banner-vectors-svg-eps-jpg-210442760.jpg',
      'https://cdn6.aptoide.com/imgs/4/d/6/4d678f324e23af8b03774960329bc357_fgraphic.png',
      'https://cdn2.arabiccoupon.com/sites/default/files/styles/icon_image/public/store_icon/american-eagle-logo-en-arabiccoupon-american-eagle-coupons-and-promo-codes-400x400.jpg',
    ];
    final listOfRestaurants = [
      'https://iconape.com/wp-content/png_logo_vector/la-brioche-doree.png',
      'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'https://assets.stickpng.com/images/5a1d30914ac6b00ff574e2a4.png',
      'https://upload.wikimedia.org/wikipedia/sco/thumb/d/d2/Pizza_Hut_logo.svg/2177px-Pizza_Hut_logo.svg.png',
    ];
    return BlocProvider(
      create: (context) => PlaceCubit(getIt<PlacesRepo>())
        ..likedKey = docID
        ..restorePersistedPref()
        ..canLaunchUrlFunction(),
      child: Scaffold(
        body: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var mallCubit = PlaceCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomPlaceImage(
                    cubitDataKeyCurrentContext:
                        mallCubit.dataKey.currentContext,
                    entity: mallModel,
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
                              ? mallModel.addressArabic
                              : mallModel.address,
                          mapUrl: mallModel.mapUrl,
                          rate: mallModel.rate,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //-------------------------------------------------------------------------
                        //Opening hours
                        OpeningHoursWidget(
                          openFrom: isArabic()
                              ? mallModel.openingHoursArabic['from']
                              : mallModel.openingHours['from'],
                          openTo: isArabic()
                              ? mallModel.openingHoursArabic['to']
                              : mallModel.openingHours['to'],
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
                                ? mallModel.descriptionArabic
                                : mallModel.description,
                          ),
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------
                        //Shopping Stores
                        HeadText(text: 'اشهر مراكز التسوق في المول '),
                        kSizedBox,
                        SizedBox(
                          height: 170,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, indexx) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => StoreScreen(
                                        mallModel: mallModel,
                                        index: indexx,
                                      ),
                                    ));
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.network(
                                      listOfStores[indexx],
                                      height: 170,
                                      width: 170,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (_, indexx) => SizedBox(
                              width: 10,
                            ),
                            itemCount: listOfStores.length,
                          ),
                        ),
                        kSizedBox,
                        //-------------------------------------------------------------------------
                        //Restaurants
                        HeadText(text: 'اشهر المطاعم في المول '),
                        kSizedBox,
                        SizedBox(
                          height: 170,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, indexx) => Container(
                              child: Column(
                                children: [
                                  Image.network(
                                    listOfRestaurants[indexx],
                                    height: 170,
                                    width: 170,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            separatorBuilder: (_, indexx) => SizedBox(
                              width: 10,
                            ),
                            itemCount: listOfRestaurants.length,
                          ),
                        ),

                        //-------------------------------------------------------------------------
                        //Images

                        GalleryWidget(
                          entity: mallModel,
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
