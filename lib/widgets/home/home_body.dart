import 'dart:ui';

import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/favourite_item_model.dart';
import 'package:your_tour_guide/screens/all_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/all_hotels_screen.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/widgets/home/build_services_widget.dart';
import 'package:your_tour_guide/widgets/home/explore_places_widget.dart';
import 'package:your_tour_guide/widgets/home/places_container_widget.dart';
import 'package:your_tour_guide/widgets/home/services_widget.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.bestplaces,
  });

  final CollectionReference<Object?> bestplaces;

  @override
  Widget build(BuildContext context) {

    List<ItemModel> listOfItemModel = [
      ItemModel(
        collectionName: 'hotels',
        imageUrl:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/df/05/b6/premier-le-reve-hotel.jpg?w=1200&h=-1&s=1',
        name: S.current.Hotels,
        // name: 'Hotels',
      ),
      ItemModel(
        collectionName: 'restaurants',
        imageUrl:
        'https://mrandmrsegypt.com/wp-content/uploads/2022/11/139-Pavilion.png',
        name: S.current.Restaurants,
        // name: 'Restaurants',

      ),
      ItemModel(
        collectionName: 'cafes',
        imageUrl: 'https://www.originaltravel.co.uk/travel-blog/ShowPhoto/235/0',
        name: S.current.Cafes,
        // name: 'Cafes',
      ),
      ItemModel(
        collectionName: 'mosques',
        imageUrl:
        'https://www.osiristours.com/wp-content/uploads/2018/11/201803070520052732.jpg',
        name: S.current.Mosques,
        // name: 'Mosques',
      ),
      ItemModel(
        collectionName: 'churchs',
        imageUrl:
        'https://static.wixstatic.com/media/5eff48_c8c9fa59d87e4281a06e07ed389504fe~mv2.jpg/v1/fill/w_640,h_426,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/5eff48_c8c9fa59d87e4281a06e07ed389504fe~mv2.jpg',
        name: S.current.Churches,
        // name: 'Mosques',
      ),
      ItemModel(
        collectionName: 'malls',
        imageUrl:
        'https://www.tripsavvy.com/thmb/OO8ZmTaAXSjpzdsJoHjWguid61E=/2121x1414/filters:no_upscale():max_bytes(150000):strip_icc()/nasr-city-shopping-mall-in-cairo-521713690-30e93a9833904e5292516cebde3a4521.jpg',
        name: S.current.Malls,
        // name: 'malls',
      ),
      ItemModel(
        collectionName: 'cinemas',
        imageUrl:
        'https://www.mei.edu/sites/default/files/Egyptian%2520Cinema.jpg',
        name: S.current.Cinemas,
        // name: 'Cinemas',

      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 14, right: 14, bottom: 14),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------------------------------------------------------
              //Explore
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).Explore,
                        // S.of(context).Explore,
                        style: TextStyle(
                          fontSize: 28,
                          // color: Colors.black,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if(HomeCubit.get(context).isDark == true){
                              HomeCubit.get(context).changeThemeMode(true);
                              }
                              else {
                              HomeCubit.get(context).changeThemeMode(false);

                              }
                            },

                            icon: Icon(Icons.dark_mode),
                          ),
                          //

                          PopupMenuButton(
                              icon: Icon(
                                Icons.language,
                              ),
                              itemBuilder: (_) {
                                return [
                                  PopupMenuItem(
                                    child: Text('Arabic'),
                                    onTap: () {
                                      BlocProvider.of<HomeCubit>(context)
                                          .changeLanguage('ar');
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: Text('English'),
                                    onTap: () {
                                      // BlocProvider.of<LocaleCubit>(context).restartApp();
                                      BlocProvider.of<HomeCubit>(context)
                                          .changeLanguage('en');
                                    },
                                  ),
                                ];
                              }),
                        ],
                      ),
                    ],
                  ),
                  // More about Egypt
                  Text(
                    // 'moreAboutEgypt',
                    S.of(context).moreAboutEgypt,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // ExploreMoreWidget(),
              kSizedBox,
              //-----------------------------------------------------------------
              ServicesWidget(),
              kSizedBox,
              //----------------------------------------------------------------
              //Travel Places with view all button
              ExplorePlacesWidget(),
              kSizedBox,
              //----------------------------------------------------------------
              //Places
              FutureBuilder<QuerySnapshot>(
                  future: bestplaces.orderBy("rate",descending: true).where('isBest', isEqualTo: true).get(),
                  builder: (context, snapshot) {
                    final List<QueryDocumentSnapshot>? allDocs =
                        snapshot.data?.docs;
                    if (allDocs == null) {
                      Center(
                          child: CircularProgressIndicator(
                        color: Colors.orange,
                      ));
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.orange,
                      ));
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return PlacesContainerWidget(
                        allDocs: allDocs,
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.orange,
                    ));
                  }),
              kSizedBox,
              //----------------------------------------------------------------
              //Services
              HeadText(text: S.of(context).services),
              kSizedBox,
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          listOfItemModel[index].collectionName == 'hotels'
                              ? AllHotels(cityName: '')
                              : AllScreen(
                            collectionName: listOfItemModel[index].collectionName,
                            appBarText: listOfItemModel[index].name,
                            cityName: '',
                          ),
                        ));
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child:
                        CachedNetworkImage(imageUrl: listOfItemModel[index].imageUrl,
                        fit: BoxFit.cover,
                        ),
                        // Image.network(
                        //   listOfItemModel[index].imageUrl,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      ClipRRect(
                        // Clip it cleanly.
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                          child: Container(
                            color: Colors.grey.withOpacity(0.1),
                            alignment: Alignment.center,
                            child: BorderedText(
                              strokeWidth: 2,
                              strokeColor: Colors.black,
                              child: Text(
                                listOfItemModel[index].name,
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: BuildServicesWidget.listOfItemModel.length,
              ),
              kSizedBox,
              //----------------------------------------------------------------
            ],
          ),
        ],
      ),
    );
  }
}