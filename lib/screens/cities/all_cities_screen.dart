
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/screens/cities/city_screen.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/list_view_all_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCities extends StatelessWidget {
  static String id = 'allCities';

  const AllCities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference cities =
    FirebaseFirestore.instance.collection('cities');

    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllCities,
        leading: CustomAppBarIconButton(),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: cities.get(),
          builder: (context, snapshot) {
            List<QueryDocumentSnapshot>? allCities = snapshot.data?.docs;
            if (allCities == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.orange,
              ));
            }
            else if (snapshot.connectionState == ConnectionState.done) {

              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => BuildAllItem(
                  pushedPage: CityScreen(
                    cityName: allCities[index]['cityName'],
                  ),
                  imageUrl: allCities[index]['imageUrl'],
                  index: index,
                  allDocs: allCities,
                  itemNameOnFireBase: allCities[index][S.of(context).cityName],
                ),
                separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
                itemCount: allCities.length,
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




