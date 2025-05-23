import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/screens/tours/tour_type_tours_view.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/list_view_all_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllTours extends StatelessWidget {
  static String id = 'AllTours';

  const AllTours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tourTypeList = [
      'dayTour',
      'tourPackage',
      'egyptiansTrip',
      'nile',
    ];
    List<String> appBarTextList = [
      S.of(context).dayTour,
      S.of(context).tourPackage,
      S.of(context).egyptiansTrip,
      S.of(context).nileCruise,
    ];
    final CollectionReference tours =
        FirebaseFirestore.instance.collection('Tours');
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllTours,
        leading: CustomAppBarIconButton(),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: tours.get(),
          builder: (context, snapshot) {
            List<QueryDocumentSnapshot>? allDocs = snapshot.data?.docs;
            if (allDocs == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.orange,
              ));
            }
            else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => BuildAllItem(
                  index: index,
                  allDocs: allDocs,
                  pushedPage: TourTypeTours(
                    tourType: tourTypeList[index],
                    appBarText: appBarTextList[index],
                  ),
                  itemNameOnFireBase: isArabic()? allDocs[index]['nameArabic']:allDocs[index]['name'],
                  imageUrl: allDocs[index]['imageUrl'],
                ),
                separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
                itemCount: allDocs.length,
              );
            }
            return Center(
                child: CircularProgressIndicator(
              color: Colors.orange,
            ));
          }),
    );
  }
}
