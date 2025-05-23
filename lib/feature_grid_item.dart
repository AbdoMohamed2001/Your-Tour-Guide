import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildFeatureGridItem extends StatelessWidget {
  const BuildFeatureGridItem({
    Key? key,
    required this.index,
    required this.hotelModel,
    required this.height,
    required this.width,

  }) : super(key: key);
  final int index;
  final HotelModel hotelModel;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var features = isArabic()
        ? hotelModel.featuresArabic![index]
        : hotelModel.features![index];
    return Container(
      height: screenHeight*0.12,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //============================Cherry Maryski Hotel=========================================
          features.contains('wifi') || features.contains('وايفاي')
              ? featureGridContainer(icon: Icons.wifi)
          //----------------------------------------------------------------
              : features.contains('pool') || features.contains('سباح')
              ? featureGridContainer(icon: Icons.pool)
          //---------------------------------------------------------------
              : features.contains('rest') || features.contains('مطعم')
              ? featureGridContainer(icon: Icons.restaurant_rounded)

          //=====================================================================
              : features.contains('smoking') ||
              features.contains('مدخنين')
              ? featureGridContainer(icon: Icons.smoking_rooms)
          //----------------------------------------------------------------
              : features.contains('cribs') ||
              features.contains('أسرة أطفال')
              ? featureGridContainer(icon: Icons.crib)
          //----------------------------------------------------------------
              : features.contains('sauna') ||
              features.contains('ساونا')
              ? featureGridContainer(icon: Icons.flare)
          //----------------------------------------------------------------

              : features.contains('pet') ||
              features.contains('حيوان')
              ? featureGridContainer(icon: Icons.pets)
          //----------------------------------------------------------------
              : features.contains('air') ||
              features.contains('هوا')
              ? featureGridContainer(icon: Icons.air)
              :
          //----------------------------------------------------------------
          features.contains('air cond') ||
              features.contains('تكيي')
              ? featureGridContainer(icon: Icons.air)
              :
          //----------------------------------------------------------------
          features.contains('BBQ') ||
              features.contains('شواء')
              ? featureGridContainer(
              icon: Icons.outdoor_grill)
              :
          //----------------------------------------------------------------
          features.contains('spa') ||
              features.contains('سبا')
              ? featureGridContainer(
              icon: Icons.spa)
              :
          //----------------------------------------------------------------
          features.contains('bath') ||
              features
                  .contains('حوض')
              ? featureGridContainer(
              icon: Icons.bathtub)
              :
          //----------------------------------------------------------------
          features.contains('airport') ||
              features.contains(
                  'مطار')
              ? featureGridContainer(
              icon: Icons
                  .local_airport)
              :
          //----------------------------------------------------------------
          features.contains(
              'meet') ||
              features.contains(
                  'جتماع')
              ? featureGridContainer(
              icon: Icons
                  .meeting_room)
              :
          //----------------------------------------------------------------
          features.contains(
              'xercise') ||
              features.contains(
                  'تمرين')
              ? featureGridContainer(
              icon: Icons
                  .fitness_center)
              :
          //----------------------------------------------------------------
          features.contains('sea') ||
              features.contains('شاط') ||features.contains('beach')
              ? featureGridContainer(icon: Icons.beach_access)

          //-----------------------------------------------------------------
              : features.contains('housekeeping') || features.contains('تنظيف يومية')
              ? featureGridContainer(icon: Icons.cleaning_services)

          //-----------------------------------------------------------------
              : features.contains('banquet') || features.contains('ولائم')
              ? featureGridContainer(icon: Icons.brunch_dining)

          //----------------------------------------------------------------
              : features.contains('yoga') || features.contains('يوجا')
              ? featureGridContainer(icon: Icons.self_improvement)
          //----------------------------------------------------------------
              : features.contains('sun') || features.contains('مشمس')
              ? featureGridContainer(icon: Icons.sunny)
          //----------------------------------------------------------------
              : features.contains('city') || features.contains('مدين')
              ? featureGridContainer(icon: Icons.location_city)

          //----------------------------------------------------------------
              : features.contains('balcony') || features.contains('شرفة')
              ? featureGridContainer(icon: Icons.balcony)

          //----------------------------------------------------------------
              : features.contains('par') || features.contains('موقف')
              ? featureGridContainer(icon: Icons.local_parking)
          //----------------------------------------------------------------
              : features.contains('gard') || features.contains('حديق')
              ? featureGridContainer(icon: Icons.yard)
          //----------------------------------------------------------------
              : features.contains('reakfast') || features.contains('فطور') ||features.contains('فطار')
              ? featureGridContainer(icon: Icons.free_breakfast)
          //----------------------------------------------------------------
              : features.contains('urrency') || features.contains('عمل')
              ? featureGridContainer(icon: Icons.price_change)
          //----------------------------------------------------------------
              : features.contains('roof') || features.contains('سطح')
              ? featureGridContainer(icon: Icons.roofing)
          //----------------------------------------------------------------
              : features.contains('enting cars') || features.contains('سيارات')
              ? featureGridContainer(icon: Icons.directions_car_filled_sharp)
          //----------------------------------------------------------------
              : features.contains('garage') || features.contains('مرأب')
              ? featureGridContainer(icon: Icons.garage)
          //----------------------------------------------------------------
              : features.contains('ealth') || features.contains('صحي')
              ? featureGridContainer(icon: Icons.health_and_safety)
          //----------------------------------------------------------------
              : features.contains('ance') || features.contains('رقص  ')
              ? featureGridContainer(icon: Icons.nightlife)
          //----------------------------------------------------------------

              : features.contains('coffee') || features.contains('قهوه')
              ? featureGridContainer(icon: FontAwesomeIcons.coffee)
          //----------------------------------------------------------------
              : features.contains('child') || features.contains('طفل') ||features.contains('طفال')
              ? featureGridContainer(
            icon: FontAwesomeIcons.child,
          )
          //----------------------------------------------------------------
              : features.contains('accom') ||features.contains('إقامة')
              ? featureGridContainer(icon: FontAwesomeIcons.home)
          //----------------------------------------------------------------
              : features.contains('bar') || features.contains('بار')
              ? featureGridContainer(icon: Icons.local_bar)

          //----------------------------------------------------------------
              : features.contains('city')
              ? featureGridContainer(icon: Icons.location_city)
          //----------------------------------------------------------------
              : features.contains('casino') || features.contains('كاسين')
              ? featureGridContainer(icon: Icons.casino)
          //----------------------------------------------------------------
              : features.contains('fitness') || features.contains('لياق')
              ? featureGridContainer(icon: Icons.fitness_center)
          //----------------------------------------------------------------
              : features.contains('clean') || features.contains('تنظيف')
              ? featureGridContainer(icon: Icons.dry_cleaning)
          //----------------------------------------------------------------
              : features.contains('room') || features.contains('غرف')
              ? featureGridContainer(icon: Icons.room_service)

          //----------------------------------------------------------------
              : featureGridContainer(icon: FontAwesomeIcons.star),
          SizedBox(
            height: screenHeight*0.005,
          ),
          Text(
            '${features}'.replaceAll('_b', '\n').toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 8,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
class featureGridContainer extends StatelessWidget {
  const featureGridContainer({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orangeAccent,
          ),
        ),
        width: 32,
        height: screenHeight*0.05,
        child: Icon(
          icon,
          size: 30,
        ));
  }
}