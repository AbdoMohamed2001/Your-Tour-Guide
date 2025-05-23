import 'package:your_tour_guide/models/hotel_model.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildFacilitiesItem extends StatelessWidget {
  const BuildFacilitiesItem({
    Key? key,
    required this.index,
    required this.hotelModel,
  }) : super(key: key);
  final int index;
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    var features = isArabic()
        ? hotelModel.roomFacilitiesArabic![index]
        : hotelModel.roomFacilities![index];
    return Container(
      width: MediaQuery.of(context).size.width * .010,
      height: MediaQuery.of(context).size.height * .145,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          features.contains('wifi') || features.contains('وايفاي')
              ? featureContainer(icon: Icons.wifi) :
          //----------------------------------------------------------------
          features.contains('Desk') || features.contains('مكتب')
              ? featureContainer(icon: Icons.desk):
          //----------------------------------------------------------------
          features.contains('TV') || features.contains('تلفاز')
              ? featureContainer(icon: Icons.tv):
          //----------------------------------------------------------------
          features.contains('Wake') || features.contains('خدمة الإيقاظ')
              ? featureContainer(icon: Icons.alarm):
          //----------------------------------------------------------------
          features.contains('Iron') || features.contains('الكي')
              ? featureContainer(icon: Icons.iron):
          //----------------------------------------------------------------
          features.contains('Socket') || features.contains('مقبس')
              ? featureContainer(icon: Icons.power):
          //----------------------------------------------------------------
          features.contains('Tea') || features.contains('شاي')
              ? featureContainer(icon: Icons.coffee_maker):
          //----------------------------------------------------------------
          features.contains('Safe') || features.contains('شاي')
              ? featureContainer(icon: Icons.gif_box):
          //----------------------------------------------------------------
          features.contains('Cloth') || features.contains('من')
              ? featureContainer(icon: Icons.checkroom):
          // ----------------------------------------------------------------
          features.contains('Towel') || features.contains('مناشف')
              ? featureContainer(icon: Icons.bathroom):
          //----------------------------------------------------------------
          features.contains('Minibar') || features.contains('ميني')
              ? featureContainer(icon: Icons.kitchen):
          //----------------------------------------------------------------
          features.contains('kettle') || features.contains('غلاية')
              ? featureContainer(icon: Icons.electrical_services_rounded):
          //----------------------------------------------------------------
          features.contains('AC') || features.contains('تكييف')
              ? featureContainer(icon: Icons.air):
          //----------------------------------------------------------------
           features.contains('Ward') || features.contains('خزان')
              ? featureContainer(icon: Icons.checkroom):
          //----------------------------------------------------------------
           features.contains('Air') || features.contains('تكييف')
              ? featureContainer(icon: Icons.air):
          //----------------------------------------------------------------
features.contains('Inter') || features.contains('متصل')
              ? featureContainer(icon: Icons.room_preferences):
          //----------------------------------------------------------------
features.contains('Linens') || features.contains('كتان')|| features.contains('بياضا')
              ? featureContainer(icon: Icons.dry):
          //----------------------------------------------------------------
features.contains('Wi') || features.contains('واي')
              ? featureContainer(icon: Icons.wifi):
          //----------------------------------------------------------------
features.contains('entrance') || features.contains('مدخل')
              ? featureContainer(icon: Icons.door_sliding):
          //----------------------------------------------------------------
features.contains('Hair') || features.contains('مجفف')
              ? featureContainer(icon: Icons.dry):
          //----------------------------------------------------------------
features.contains('Fan') || features.contains('مروح')
    ? featureContainer(icon: FontAwesomeIcons.fan):
//----------------------------------------------------------------

              featureContainer(icon: FontAwesomeIcons.star),
          SizedBox(
            height: 10,
          ),
          Text(
            '${features}'.replaceAll('_b', '\n').toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 12,
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
