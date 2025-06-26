import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/core/utils/widgets/rate_widget.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.address,
    required this.mapUrl,
    required this.rate,
  });

  final String address;
  final String mapUrl;
  final num? rate;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //location
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Icon(
                      FontAwesomeIcons.mapMarkedAlt,
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: screenWidth * 0.7,
                    child: Text(
                      address,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              //google map
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    MapsLauncher.launchQuery(address);
                  },
                  child: Container(
                    child: Image.asset(
                      HomeCubit.get(context).isDark!
                          ? 'assets/images/googleMapsDark.png'
                          : 'assets/images/googlemaps.png',
                      width: screenWidth * 0.120,
                      height: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
          kSizedBox,
          //-----------------------------
          //rate bar
          RateWidget(rate: rate, starIconIncluded: true),
          SizedBox(height: 25),
          //-----------------------------
          Divider(
            height: 0.5,
            thickness: 1,
            color: Colors.grey[300],
          ),
          kSizedBox,
        ],
      ),
    );
  }
}
