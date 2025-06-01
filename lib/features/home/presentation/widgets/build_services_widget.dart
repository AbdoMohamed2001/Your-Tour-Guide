import 'dart:ui';

import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/models/services_container_entity.dart';
import 'package:your_tour_guide/screens/all_screen.dart';
import 'package:your_tour_guide/screens/servicesProvider/hotels/all_hotels_screen.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class BuildFeaturesGridView extends StatelessWidget {
  const BuildFeaturesGridView({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  static List<ServicesContainerEntity> listOfServicesContainerEntity = [
    ServicesContainerEntity(
      collectionName: 'hotels',
      imageUrl:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/df/05/b6/premier-le-reve-hotel.jpg?w=1200&h=-1&s=1',
      name: S.current.Hotels,
      // name: 'Hotels',
    ),
    ServicesContainerEntity(
      collectionName: 'restaurants',
      imageUrl:
          'https://img.theculturetrip.com/wp-content/uploads/2020/03/b5bn3r.jpg',
      name: S.current.Restaurants,
      // name: 'Restaurants',
    ),
    ServicesContainerEntity(
      collectionName: 'cafes',
      imageUrl: 'https://www.originaltravel.co.uk/travel-blog/ShowPhoto/235/0',
      name: S.current.Cafes,
      // name: 'Cafes',
    ),
    ServicesContainerEntity(
      collectionName: 'mosques',
      imageUrl:
          'https://www.osiristours.com/wp-content/uploads/2018/11/201803070520052732.jpg',
      name: S.current.Mosques,
      // name: 'Mosques',
    ),
    ServicesContainerEntity(
      collectionName: 'churchs',
      imageUrl:
          'https://static.wixstatic.com/media/5eff48_c8c9fa59d87e4281a06e07ed389504fe~mv2.jpg/v1/fill/w_640,h_426,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/5eff48_c8c9fa59d87e4281a06e07ed389504fe~mv2.jpg',
      name: S.current.Churches,
      // name: 'Mosques',
    ),
    ServicesContainerEntity(
      collectionName: 'malls',
      imageUrl:
          'https://www.tripsavvy.com/thmb/OO8ZmTaAXSjpzdsJoHjWguid61E=/2121x1414/filters:no_upscale():max_bytes(150000):strip_icc()/nasr-city-shopping-mall-in-cairo-521713690-30e93a9833904e5292516cebde3a4521.jpg',
      name: S.current.Malls,
      // name: 'malls',
    ),
    ServicesContainerEntity(
      collectionName: 'cinemas',
      imageUrl:
          'https://www.mei.edu/sites/default/files/Egyptian%2520Cinema.jpg',
      name: S.current.Cinemas,
      // name: 'Cinemas',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => listOfServicesContainerEntity[index]
                          .collectionName ==
                      'hotels'
                  ? AllHotels(cityName: '')
                  : AllScreen(
                      collectionName:
                          listOfServicesContainerEntity[index].collectionName,
                      appBarText: listOfServicesContainerEntity[index].name,
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
            child: Image.network(
              listOfServicesContainerEntity[index].imageUrl,
              fit: BoxFit.cover,
            ),
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
                  strokeWidth: 4,
                  child: Text(
                    listOfServicesContainerEntity[index].name,
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
    );
  }
}
