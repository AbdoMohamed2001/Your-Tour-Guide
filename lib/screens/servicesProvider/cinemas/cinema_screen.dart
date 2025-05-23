// ignore_for_file: missing_required_param
import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/models/cinema_model.dart';
import 'package:your_tour_guide/screens/servicesProvider/cinemas/film_screen.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/hotel/contact_widget.dart';
import 'package:your_tour_guide/widgets/location_widget.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:your_tour_guide/widgets/place/custom_place_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';

class CinemaScreen extends StatelessWidget {
  CinemaScreen({
    Key? key,
    required this.cinemaModel,
    required this.docID,
  }) : super(key: key);

  final CinemaModel cinemaModel;
  final docID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit()
        ..likedKey = docID
        ..restorePersistedPref(),
      child: Scaffold(
        appBar: NoneAppBar(),
        body: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var cinemaCubit = PlaceCubit.get(context);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //------------------------------------------------------------------------
                    //Image
                    CustomPlaceImage(
                      docID: docID,
                      imageUrl: cinemaModel.imageUrl,
                      name: isArabic()
                          ? cinemaModel.nameArabic
                          : cinemaModel.name,
                      cityName: isArabic()
                          ? cinemaModel.cityNameArabic
                          : cinemaModel.cityName,
                      containerImage: cinemaModel.images!.isEmpty
                          ? ''
                          : cinemaModel.images![0],
                      cubitLikedValue: cinemaCubit.likedValue,
                      favouriteFunction: () {
                        cinemaCubit.changeLike();
                        if (cinemaCubit.likedValue == true) {
                          CacheData.setData(
                              key: cinemaCubit.likedKey,
                              value: cinemaCubit.likedValue);
                          cinemaCubit.addCinemaToFavourite(
                            cinemaModel: cinemaModel,
                            docID: docID,
                            context: context,
                          );
                        } else {
                          CacheData.setData(
                              key: cinemaCubit.likedKey,
                              value: cinemaCubit.likedValue);
                          cinemaCubit.deleteFromFavourite(
                            context: context,
                            docID: docID,
                          );
                        }
                      },
                      cubitDataKeyCurrentContext:
                          cinemaCubit.dataKey.currentContext,
                      images: cinemaModel.images!,
                    ),
                    kSizedBox,
                    //------------------------------------------------------------------------
                    //location and googleMaps
                    LocationWidget(
                      address: isArabic()
                          ? cinemaModel.addressArabic
                          : cinemaModel.address,
                      englishAddress: cinemaModel.address,
                      mapUrl: cinemaModel.mapUrl,
                      rate: cinemaModel.rate,
                    ),
                    //-------------------------------------------------------------------------
                    //Films
                    HeadText(text: S.of(context).films),
                    kSizedBox,
                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => FilmWidget(
                          cinemaModel: cinemaModel,
                          index: index,
                        ),
                        separatorBuilder: (_, index) => SizedBox(
                          width: 4,
                        ),
                        itemCount: cinemaModel.films!.length,
                      ),
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    ContactWidget(model: cinemaModel, cubit: cinemaCubit),
                    kSizedBox,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FilmWidget extends StatelessWidget {
  const FilmWidget({
    super.key,
    required this.cinemaModel,
    required this.index,
  });

  final CinemaModel cinemaModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return FilmScreen(
            cinemaModel: cinemaModel,
            index: index,
          );
        }));
      },
      child: Container(
        width: 170,
        color:
            HomeCubit.get(context).isDark! ? Colors.black54 : Color(0xffDBD3D8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.network(
                  cinemaModel.films![index]['imageUrl'],
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  isArabic()
                      ? cinemaModel.filmsArabic![index]['name']
                          .replaceAll('_b', '\n')
                      : cinemaModel.films![index]['name']
                          .replaceAll('_b', '\n'),
                  textAlign: TextAlign.center,

                  // 'Oppenheimer'
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isArabic()
                            ? cinemaModel.filmsArabic![index]['price']
                            : cinemaModel.films![index]['price'],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                          ),
                          Text('${cinemaModel.films![index]['rate']}/10'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
