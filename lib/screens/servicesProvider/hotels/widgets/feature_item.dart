import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildFeatureItem extends StatelessWidget {
  const BuildFeatureItem({
    Key? key,
    required this.index,
    required this.hotelModel,
  }) : super(key: key);
  final int index;
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    var features = isArabic()
        ? hotelModel.featuresArabic![index]
        : hotelModel.features![index];
    return Container(
      width: MediaQuery.of(context).size.width * .20,
      // height: MediaQuery.of(context).size.height * .142,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //============================Cherry Maryski Hotel=========================================
          features.contains('wifi') || features.contains('وايفاي')
              ? featureContainer(icon: Icons.wifi)
              //----------------------------------------------------------------
              : features.contains('pool') || features.contains('سباح')
                  ? featureContainer(icon: Icons.pool)
                  //---------------------------------------------------------------
                  : features.contains('rest') || features.contains('مطعم')
                      ? featureContainer(icon: Icons.restaurant_rounded)

                          //=====================================================================
                          : features.contains('smoking') ||
                                  features.contains('مدخنين')
                              ? featureContainer(icon: Icons.smoking_rooms)
                              //----------------------------------------------------------------
              : features.contains('cribs') ||
              features.contains('أسرة أطفال')
              ? featureContainer(icon: Icons.crib)
          //----------------------------------------------------------------
              : features.contains('sauna') ||
              features.contains('ساونا')
              ? featureContainer(icon: Icons.flare)
          //----------------------------------------------------------------

                              : features.contains('pet') ||
                                      features.contains('حيوان')
                                  ? featureContainer(icon: Icons.pets)
                                  //----------------------------------------------------------------
                                  : features.contains('air') ||
                                          features.contains('هوا')
                                      ? featureContainer(icon: Icons.air)
                                      :
                                      //----------------------------------------------------------------
                                      features.contains('air cond') ||
                                              features.contains('تكيي')
                                          ? featureContainer(icon: Icons.air)
                                          :
                                          //----------------------------------------------------------------
                                          features.contains('BBQ') ||
                                                  features.contains('شواء')
                                              ? featureContainer(
                                                  icon: Icons.outdoor_grill)
                                              :
                                              //----------------------------------------------------------------
                                              features.contains('spa') ||
                                                      features.contains('سبا')
                                                  ? featureContainer(
                                                      icon: Icons.spa)
                                                  :
                                                  //----------------------------------------------------------------
                                                  features.contains('bath') ||
                                                          features
                                                              .contains('حوض')
                                                      ? featureContainer(
                                                          icon: Icons.bathtub)
                                                      :
                                                      //----------------------------------------------------------------
                                                      features.contains('airport') ||
                                                              features.contains(
                                                                  'مطار')
                                                          ? featureContainer(
                                                              icon: Icons
                                                                  .local_airport)
                                                          :
                                                          //----------------------------------------------------------------
                                                          features.contains(
                                                                      'meet') ||
                                                                  features.contains(
                                                                      'جتماع')
                                                              ? featureContainer(
                                                                  icon: Icons
                                                                      .meeting_room)
                                                              :
                                                              //----------------------------------------------------------------
                                                              features.contains(
                                                                          'xercise') ||
                                                                      features.contains(
                                                                          'تمرين')
                                                                  ? featureContainer(
                                                                      icon: Icons
                                                                          .fitness_center)
                                                                  :
                                                                  //----------------------------------------------------------------
                                                                  features.contains('sea') ||
                                                                          features.contains('شاط') ||features.contains('beach')
                                                                      ? featureContainer(icon: Icons.beach_access)

                                                                      //-----------------------------------------------------------------
                                                                      : features.contains('housekeeping') || features.contains('تنظيف يومية')
                                                                      ? featureContainer(icon: Icons.cleaning_services)

                                                                  //-----------------------------------------------------------------
                                                                      : features.contains('banquet') || features.contains('ولائم')
                                                                          ? featureContainer(icon: Icons.brunch_dining)

                                                                          //----------------------------------------------------------------
                                                                          : features.contains('yoga') || features.contains('يوجا')
                                                                              ? featureContainer(icon: Icons.self_improvement)
                                                                              //----------------------------------------------------------------
                                                                              : features.contains('sun') || features.contains('مشمس')
                                                                                  ? featureContainer(icon: Icons.sunny)
                                                                                  //----------------------------------------------------------------
                                                                                  : features.contains('city') || features.contains('مدين')
                                                                                      ? featureContainer(icon: Icons.location_city)

                                                                                      //----------------------------------------------------------------
                                                                                      : features.contains('balcony') || features.contains('شرفة')
                                                                                          ? featureContainer(icon: Icons.balcony)

                                                                                          //----------------------------------------------------------------
                                                                                          : features.contains('par') || features.contains('موقف')
                                                                                              ? featureContainer(icon: Icons.local_parking)
                                                                                              //----------------------------------------------------------------
                                                                                              : features.contains('gard') || features.contains('حديق')
                                                                                                  ? featureContainer(icon: Icons.yard)
                                                                                                  //----------------------------------------------------------------
                                                                                                  : features.contains('reakfast') || features.contains('فطور') ||features.contains('فطار')
                                                                                                      ? featureContainer(icon: Icons.free_breakfast)
                                                                                                      //----------------------------------------------------------------
                                                                                                      : features.contains('urrency') || features.contains('عمل')
                                                                                                          ? featureContainer(icon: Icons.price_change)
                                                                                                          //----------------------------------------------------------------
                                                                                                          : features.contains('roof') || features.contains('سطح')
                                                                                                              ? featureContainer(icon: Icons.roofing)
                                                                                                              //----------------------------------------------------------------
                                                                                                              : features.contains('enting cars') || features.contains('سيارات')
                                                                                                                  ? featureContainer(icon: Icons.directions_car_filled_sharp)
                                                                                                                  //----------------------------------------------------------------
                                                                                                                  : features.contains('garage') || features.contains('مرأب')
                                                                                                                      ? featureContainer(icon: Icons.garage)
                                                                                                                      //----------------------------------------------------------------
                                                                                                                      : features.contains('ealth') || features.contains('صحي')
                                                                                                                          ? featureContainer(icon: Icons.health_and_safety)
                                                                                                                          //----------------------------------------------------------------
                                                                                                                          : features.contains('ance') || features.contains('رقص  ')
                                                                                                                              ? featureContainer(icon: Icons.nightlife)
                                                                                                                              //----------------------------------------------------------------

                                                                                                                              : features.contains('coffee') || features.contains('قهوه')
                                                                                                                                  ? featureContainer(icon: FontAwesomeIcons.coffee)
                                                                                                                                  //----------------------------------------------------------------
                                                                                                                                  : features.contains('child') || features.contains('طفل') ||features.contains('طفال')
                                                                                                                                      ? featureContainer(
                                                                                                                                          icon: FontAwesomeIcons.child,
                                                                                                                                        )
                                                                                                                                      //----------------------------------------------------------------
                                                                                                                                      : features.contains('accom') ||features.contains('إقامة')
                                                                                                                                          ? featureContainer(icon: FontAwesomeIcons.home)
                                                                                                                                          //----------------------------------------------------------------
                                                                                                                                          : features.contains('bar') || features.contains('بار')
                                                                                                                                              ? featureContainer(icon: Icons.local_bar)

                                                                                                                                              //----------------------------------------------------------------
                                                                                                                                              : features.contains('city')
                                                                                                                                                  ? featureContainer(icon: Icons.location_city)
                                                                                                                                                  //----------------------------------------------------------------
                                                                                                                                                  : features.contains('casino') || features.contains('كاسين')
                                                                                                                                                      ? featureContainer(icon: Icons.casino)
                                                                                                                                                      //----------------------------------------------------------------
                                                                                                                                                      : features.contains('fitness') || features.contains('لياق')
                                                                                                                                                          ? featureContainer(icon: Icons.fitness_center)
                                                                                                                                                          //----------------------------------------------------------------
                                                                                                                                                          : features.contains('clean') || features.contains('تنظيف')
                                                                                                                                                              ? featureContainer(icon: Icons.dry_cleaning)
                                                                  //----------------------------------------------------------------
                                                                      : features.contains('room') || features.contains('غرف')
                                                                      ? featureContainer(icon: Icons.room_service)

                                                                                                                                                              //----------------------------------------------------------------
                                                                                                                                                              : featureContainer(icon: FontAwesomeIcons.star),
          SizedBox(
            height: 10,
          ),
          Text(
            '${features}'.replaceAll('_b', '\n').toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}






class featureContainer extends StatelessWidget {
  const featureContainer({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orangeAccent,
          ),
        ),
        width: 45,
        child: Icon(
          icon,
          size: 40,
        ));
  }
}

