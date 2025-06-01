import 'dart:ui';

import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../models/services_container_entity.dart';
import '../../../../screens/all_screen.dart';
import '../../../../screens/servicesProvider/hotels/all_hotels_screen.dart';

class ServicesGridViewItem extends StatelessWidget {
  const ServicesGridViewItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => getServicesContainerList(context)[index]
                          .collectionName ==
                      'hotels'
                  ? AllHotels(cityName: '')
                  : AllScreen(
                      collectionName: getServicesContainerList(context)[index]
                          .collectionName,
                      appBarText: getServicesContainerList(context)[index].name,
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
            child: CachedNetworkImage(
              imageUrl: getServicesContainerList(context)[index].imageUrl,
              fit: BoxFit.cover,
            ),
            // Image.network(
            //   listOfServicesContainerEntity[index].imageUrl,
            //   fit: BoxFit.cover,
            // ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
              child: Container(
                alignment: Alignment.center,
                child: BorderedText(
                  strokeWidth: 2,
                  strokeColor: Colors.black,
                  child: Text(
                    getServicesContainerList(context)[index].name,
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
