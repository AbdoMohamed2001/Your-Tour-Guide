import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/core/utils/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:your_tour_guide/generated/assets.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //location
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  FontAwesomeIcons.mapMarkedAlt,
                  size: 22,
                ),
                SizedBox(width: screenWidth * 0.04),
                Container(
                  width: screenWidth * 0.7,
                  child: Text(
                    address,
                    style: TextStyles.bold14,
                  ),
                ),
              ],
            ),
            //google map
            GestureDetector(
              onTap: () {
                MapsLauncher.launchQuery(address);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  Assets.imagesGooglemaps,
                  width: screenWidth * 0.1,
                  height: 35,
                ),
              ),
            ),
          ],
        ),
        kSizedBox,
        //-----------------------------
        //rate bar
        RateWidget(rate: rate, starIconIncluded: true),
        const SizedBox(height: 25),
        //-----------------------------
        kDivider,
      ],
    );
  }
}
