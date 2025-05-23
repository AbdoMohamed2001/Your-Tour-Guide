import 'package:your_tour_guide/models/tour_model.dart';
import 'package:your_tour_guide/tour_screen_neew.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TourTypeTours extends StatelessWidget {
  static String id = 'TourScreen';

  TourTypeTours({
    Key? key,
    required this.tourType,
    required this.appBarText,
  }) : super(key: key);

  final String tourType;
  final String appBarText;

  @override
  Widget build(BuildContext context) {
    List<TourModel>? tourList;
    CollectionReference tour = FirebaseFirestore.instance.collection('tours');
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarText,
        leading: CustomAppBarIconButton(),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: tour.where('type', isEqualTo: tourType).get(),
        builder: (context, snapshot) {
          List<QueryDocumentSnapshot>? allDocs = snapshot.data?.docs;
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          else if (snapshot.connectionState == ConnectionState.done) {
            List<TourModel> tourListt = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              tourListt.add(TourModel.fromJson(snapshot.data!.docs[i]));
              tourList = tourListt;
            }

            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => TourScreenNeew(
                            placeModel: tourList![index],
                            docID: allDocs![index].id,
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 0.5,
                          blurRadius: 4,
                          offset: const Offset(0, 0.75),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Image(
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: Container(
                                  width: double.infinity,
                                  height: 220,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                          image: NetworkImage(allDocs![index]['imageUrl']),
                        ), //Done
                        //Pyramids
                        Positioned(
                          top: 170,
                          right: isArabic() ? 15 : null,
                          left: isArabic() ? null : 15,
                          child: BorderedText(
                            strokeColor: Colors.black,
                            strokeWidth: 2,
                            strokeCap: StrokeCap.butt,
                            strokeJoin: StrokeJoin.bevel,
                            child: Text(
                              isArabic()
                                  ? allDocs[index]['nameArabic'].replaceAll('_b', '')
                                  : allDocs[index]['name'].replaceAll('_b', ''),
                              maxLines: 2,
                              // snapshot.data!['Name'],
                              style: TextStyle(
                                fontSize: 20,
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
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: allDocs!.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        },
      ),
    );
  }
}
