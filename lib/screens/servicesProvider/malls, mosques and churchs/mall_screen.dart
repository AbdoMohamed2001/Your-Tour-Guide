// ignore_for_file: missing_required_param

import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/mall_model.dart';
import 'package:your_tour_guide/screens/best_places/photo_view_page.dart';
import 'package:your_tour_guide/screens/servicesProvider/malls,%20mosques%20and%20churchs/store_screen.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/default_read_more.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/location_widget.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:your_tour_guide/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/widgets/place/custom_place_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/place/gallery_widget.dart';

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
      create: (context) => PlaceCubit()
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
                    docID: docID,
                    imageUrl: mallModel.imageUrl,
                    name: isArabic() ? mallModel.nameArabic : mallModel.name,
                    cityName: isArabic()
                        ? mallModel.cityNameArabic
                        : mallModel.cityName,
                    containerImage: mallModel.images![0],
                    cubitLikedValue: mallCubit.likedValue,
                    favouriteFunction: () {
                      mallCubit.changeLike();
                      if (mallCubit.likedValue == true) {
                        CacheData.setData(
                            key: mallCubit.likedKey,
                            value: mallCubit.likedValue);
                        mallCubit.addMallToFavourite(
                          collectionName: collectionName,
                          mallModel: mallModel,
                          docID: docID,
                          context: context,
                        );
                      } else {
                        CacheData.setData(
                            key: mallCubit.likedKey,
                            value: mallCubit.likedValue);
                        mallCubit.deleteFromFavourite(
                          context: context,
                          docID: docID,
                        );
                      }
                    },
                    cubitDataKeyCurrentContext:
                        mallCubit.dataKey.currentContext,
                    images: mallModel.images!,
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
                          englishAddress: mallModel.address,
                          mapUrl: mallModel.mapUrl,
                          rate: mallModel.rate,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //-------------------------------------------------------------------------
                        //Opening hours
                        BuildOpeningHoursItem(
                          openFrom: isArabic()
                              ? mallModel.openingHoursArabic!['from']
                              : mallModel.openingHours!['from'],
                          openTo: isArabic()
                              ? mallModel.openingHoursArabic!['to']
                              : mallModel.openingHours!['to'],
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
                                ? mallModel.descriptionArabic!
                                : mallModel.description!,
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
                          model: mallModel,
                          cubit: mallCubit,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //   child: Text(
                        //     'Images',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 22,
                        //     ),
                        //   ),
                        // ),
                        // kSizedBox,
                        // GridView.builder(
                        //   key: mallCubit.dataKey,
                        //   shrinkWrap: true,
                        //   physics: const BouncingScrollPhysics(
                        //     parent: AlwaysScrollableScrollPhysics(),
                        //   ),
                        //   padding: const EdgeInsets.all(1),
                        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 3,
                        //   ),
                        //   itemBuilder: (context, index) {
                        //     return Container(
                        //       padding: const EdgeInsets.all(0.5),
                        //       child: InkWell(
                        //         onTap: () => Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (_) => PhotoViewPage(
                        //                 photos: mallModel.images!, index: index),
                        //           ),
                        //         ),
                        //         child: Hero(
                        //           tag: mallModel.images![index],
                        //           child: CachedNetworkImage(
                        //             imageUrl: mallModel.images![index],
                        //             fit: BoxFit.cover,
                        //             placeholder: (context, url) =>
                        //                 Container(color: Colors.grey),
                        //             errorWidget: (context, url, error) => Container(
                        //               color: Colors.red.shade400,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   itemCount: mallModel.images!.length,
                        // ),
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
