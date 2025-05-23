import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.address,
    required this.englishAddress,
    required this.mapUrl,
    required this.rate,
  });

  final String? address;
  final String? englishAddress;
  final String? mapUrl;
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
                    child: Icon(FontAwesomeIcons.mapMarkedAlt,
                    size: 24,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: screenWidth *0.7,
                    child: Text(
                      address!,
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
                  onTap: (){
                    MapsLauncher.launchQuery(address!);
                  },
                  child: Container(
                    child: Image.asset(
                      HomeCubit.get(context).isDark! ? 'assets/images/googleMapsDark.png'
                      : 'assets/images/googlemaps.png',

                      width: screenWidth*0.120,
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
          RateWidget(rate: rate,
          starIconIncluded: true,
          ),
          SizedBox(height: 25,),
          //-----------------------------
          Divider(
            height: 0.5,
            thickness: 1,
            // indent: 30,
            // endIndent: 30,
            color: Colors.grey[300],
          ),
          kSizedBox,
        ],
      ),
    );
  }
}

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.rate,
    required this.starIconIncluded,
  });

  final num? rate;
  final bool? starIconIncluded;

  Widget build(BuildContext context) {
    return Row(
      children: [
        starIconIncluded == true ?Icon(FontAwesomeIcons.star,
        size: 24,
        ) : Container(),
        starIconIncluded == true ?SizedBox(width: 10,) : Container(),
        BorderedText(
          strokeColor: Colors.black,
          strokeWidth: 2,
          child: Text('($rate)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontSize: 18,

            ),
          ),
        ),
        SizedBox(width: 5,),
        RatingBar(
            ignoreGestures: true,
            itemSize: 24,
            initialRating: rate!.toDouble() ==4.6 || rate!.toDouble() == 4.7? 4.5 : rate!.toDouble(),
            allowHalfRating: true,
            ratingWidget: RatingWidget(
              full: Icon(
                Icons.star,
                color: Colors.orange,
              ),
              half: Icon(
                Icons.star_half,
                color: Colors.orange,
              ),
              empty: Icon(
                Icons.star_border_outlined,
                color: Colors.orange,
              ),
            ),
            onRatingUpdate: (rating) {}),
      ],
    );
  }
}
