// ignore_for_file: missing_required_param

import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/restaurant_model.dart';
import 'package:your_tour_guide/screens/best_places/photo_view_page.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/hotel/contact_widget.dart';
import 'package:your_tour_guide/widgets/location_widget.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:your_tour_guide/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/widgets/place/custom_place_image.dart';
import 'package:your_tour_guide/widgets/place/gallery_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantScreen extends StatelessWidget {
  RestaurantScreen({
    Key? key,
    required this.restaurantModel,
    required this.docID,
    required this.collectionName,
  }) : super(key: key);
  static String id = 'RestaurantScreen';

  final RestaurantModel restaurantModel;
  final docID;
  final String collectionName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit()
        ..likedKey = docID
        ..restorePersistedPref()
        ..canLaunchUrlFunction(),
      child: Scaffold(
        body: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var restaurantCubit = PlaceCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomPlaceImage(
                    docID: docID,
                    imageUrl: restaurantModel.imageUrl,
                    name: isArabic()
                        ? restaurantModel.nameArabic
                        : restaurantModel.name,
                    cityName: isArabic()
                        ? restaurantModel.cityNameArabic
                        : restaurantModel.cityName,
                    containerImage: restaurantModel.images![0],
                    cubitLikedValue: restaurantCubit.likedValue,
                    favouriteFunction: () {
                      restaurantCubit.changeLike();
                      if (restaurantCubit.likedValue == true) {
                        CacheData.setData(
                            key: restaurantCubit.likedKey,
                            value: restaurantCubit.likedValue);
                        restaurantCubit.addRestaurantToFavourite(
                          collectionName: collectionName,
                          restaurantModel: restaurantModel,
                          docID: docID,
                          context: context,
                        );
                      } else {
                        CacheData.setData(
                            key: restaurantCubit.likedKey,
                            value: restaurantCubit.likedValue);
                        restaurantCubit.deleteFromFavourite(
                          context: context,
                          docID: docID,
                        );
                      }
                    },
                    cubitDataKeyCurrentContext:
                        restaurantCubit.dataKey.currentContext,
                    images: restaurantModel.images!,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kSizedBox,
                        //Location and google map
                        LocationWidget(
                          address: isArabic()
                              ? restaurantModel.addressArabic
                              : restaurantModel.address,
                          englishAddress: restaurantModel.address,
                          mapUrl: restaurantModel.mapUrl,
                          rate: restaurantModel.rate,
                        ),
                        //-----------------------------------------------------------------
                        //Opening hours
                        BuildOpeningHoursItem(
                          openFrom: isArabic()
                              ? restaurantModel.openingHoursArabic!['from']
                              : restaurantModel.openingHours!['from'],
                          openTo: isArabic()
                              ? restaurantModel.openingHoursArabic!['to']
                              : restaurantModel.openingHours!['to'],
                        ),
                        kSizedBox,
                        //----------------------------------------------------
                        //Menu
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Icon(Icons.restaurant_menu),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         Text(
                        //           S.of(context).FullMenu,
                        //           style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 20,
                        //           ),
                        //         ),
                        //         Padding(
                        //           padding: const EdgeInsets.only(bottom: 3.0, left: 2),
                        //           child: Icon(
                        //             Icons.north_east,
                        //             size: 15,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        //Images of menu
                        // Image.network(restaurantModel.menuImages![0],
                        // width: double.infinity,
                        //   height: 100,
                        //   fit: BoxFit.cover,
                        // ),
                        // GridView.builder(
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
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
                        //                 photos: restaurantModel.menuImages!,
                        //                 index: index),
                        //           ),
                        //         ),
                        //         child: Hero(
                        //           tag: restaurantModel.menuImages![index],
                        //           child: CachedNetworkImage(
                        //             imageUrl: restaurantModel.menuImages![index],
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
                        //   itemCount: restaurantModel.menuImages!.length,
                        // ),
                        //------------------------------------------------------------------------
                        //contact
                        HeadText(text: S.of(context).Contact),
                        //Contact website and phone number
                        ContactWidget(
                            model: restaurantModel, cubit: restaurantCubit),
                        kSizedBox,
                        //------------------------------------------------------------------------
                        GalleryWidget(
                          cubit: restaurantCubit,
                          model: restaurantModel,
                        ),
                        kSizedBox,
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
