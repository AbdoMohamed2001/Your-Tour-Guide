import 'package:your_tour_guide/models/service_provider_model.dart';
import 'package:your_tour_guide/screens/cities/all_cities_screen.dart';
import 'package:your_tour_guide/screens/places/all_places.dart';
import 'package:your_tour_guide/screens/tours/all_tours.dart';
import 'package:your_tour_guide/screens/upcomingEvents/all_upcoming.dart';
import 'package:your_tour_guide/widgets/services_provider_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../generated/l10n.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    List<ServicesProviderModel> listOfServicesProviderModel = [
      //BestPlaces
      ServicesProviderModel(
        // name: 'bestPlaces',
        name: S.of(context).bestPlaces,
        containerColor: Color(0xff19141b),
        // containerColor: Color(0xff4d5667),
        // containerColor: Color(0xff19131b),
        pushedPage: AllPlaces(
          isBest: true,
          collectionName: 'places',
          appBarText: S.of(context).AllBestPlaces,
        ),
        icon: FontAwesomeIcons.hotel,
        fileName: 'bestPlace',
      ),
      //AllCities
      ServicesProviderModel(
        // name: 'AllCities',
          name: S.of(context).AllCities,
              containerColor: Color(0xff613208),
          pushedPage: AllCities(),
          icon: FontAwesomeIcons.solidBuilding,
          fileName: 'allCities'),
      //Tours
      ServicesProviderModel(
        // name: 'ToursAndTrips',
        name: S.of(context).ToursAndTrips,
        containerColor: Color(0xff00478F),

        // containerColor: Color(0xffD18700),
        // containerColor: Color(0xff613207),
        pushedPage: AllTours(),
        icon: FontAwesomeIcons.suitcase,
        fileName: 'tour',
      ),
      //UpcomingEvent
      ServicesProviderModel(
        // name: 'UpcomingEvents',
        name: S.of(context).UpcomingEvents,
        containerColor: Color(0xffd89d27),
        pushedPage: AllUpcoming(),
        icon: Icons.today,
        fileName: 'event',
      ),
      //Services
      // ServicesProviderModel(
      //   name: 'الخدمات',
      //   containerColor: Color(0xff2A231F),
      //   pushedPage: AllUpcoming(),
      //   icon: Icons.miscellaneous_services,
      //   fileName: 'hotel',
      // ),
      // //Religion
      // ServicesProviderModel(
      //   name: 'الاماكن \n الدينيه',
      //   containerColor: Color(0xff778D99),
      //   // containerColor: Color(0xff861c2e),
      //   pushedPage: AllUpcoming(),
      //   icon: Icons.miscellaneous_services,
      //   fileName: 'mosque',
      // ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(1),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65 / .40,
      ),
      itemBuilder: (context, index) {
        return ServiceProviderItem(
          fileName:
          listOfServicesProviderModel[index].fileName,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return listOfServicesProviderModel[index]
                      .pushedPage;
                }));
          },
          boxDecorationColor: listOfServicesProviderModel[index].containerColor,

          // boxDecorationColor: Color(0xff272727),
          // listOfServicesProviderModel[index]
          //     .containerColor,
          boxDecorationBorderRadius: 10,
          text: listOfServicesProviderModel[index].name,
        );
      },
      itemCount: listOfServicesProviderModel.length,
    );
  }
}
