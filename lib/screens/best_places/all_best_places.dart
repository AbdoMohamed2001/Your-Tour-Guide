import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/screens/best_places/best_place.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllBestPlaces extends StatelessWidget {
  static String id = 'AllBestPlaces';
  const AllBestPlaces({Key? key}) : super(key: key);


//AppBar(
  @override
  Widget build(BuildContext context) {
    final CollectionReference bestplaces =
    FirebaseFirestore.instance.collection('bestplaces');
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Best Places',
        leading: CustomAppBarIconButton(),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: bestplaces.orderBy('id').get(),
          builder: (context, snapshot) {
            List<QueryDocumentSnapshot>? allDocs = snapshot.data?.docs;
            if (allDocs == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.orange,
              ));
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BestPlaceScreen(
                        placeData: allDocs,
                        currentIndex: index,
                      );
                    }));
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Image(
                            image:
                                NetworkImage('${allDocs[index]['imageUrl']}'),
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 145,
                            left: 20,
                            child: BorderedText(
                              strokeColor: Colors.black,
                              strokeWidth: 2,
                              strokeCap: StrokeCap.butt,
                              strokeJoin: StrokeJoin.bevel,
                              child: Text(
                                '${allDocs[index]['name']}',
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ), //Done
                        ],
                      ),
                    ),
                  ),
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


