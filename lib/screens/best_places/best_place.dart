// ignore_for_file: must_be_immutable

import 'package:your_tour_guide/core/services/cacheHelper.dart';
import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/resources/auth_methods.dart';
import 'package:your_tour_guide/screens/best_places/photo_view_page.dart';
import 'package:your_tour_guide/widgets/opening_hours_item.dart';
import 'package:your_tour_guide/widgets/tickets_item.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BestPlaceScreen extends StatefulWidget {
  BestPlaceScreen(
      {Key? key, required this.placeData, required this.currentIndex})
      : super(key: key);
  List<QueryDocumentSnapshot> placeData;
  int currentIndex;

  @override
  State<BestPlaceScreen> createState() => _BestPlaceScreenState();
}

class _BestPlaceScreenState extends State<BestPlaceScreen> {
  late var likedKey = widget.placeData[widget.currentIndex].id;
  late bool liked = false;
  final storage = FirebaseStorage.instance;
  final dataKey = new GlobalKey();
  bool isFavourite = false;
  bool isRated = false;
  Color iconColor = Colors.white;
  Color isRatedColor = Colors.black;
  @override
  void initState() {
    super.initState();
    _restorePersistedPref();
  }

  void _restorePersistedPref() async {
    var preferences = await SharedPreferences.getInstance();
    var liked = preferences.getBool(likedKey);
    setState(() {
      liked == null ? print('') : this.liked = liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    var docID = widget.placeData[widget.currentIndex].id;
    var place = widget.placeData[widget.currentIndex];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                      image: NetworkImage(place['imageUrl']),
                    ), //Done
                    //Pyramids
                    Positioned(
                      top: 245,
                      left: 20,
                      child: BorderedText(
                        strokeColor: Colors.black,
                        strokeWidth: 2,
                        strokeCap: StrokeCap.butt,
                        strokeJoin: StrokeJoin.bevel,
                        child: Text(
                          place['name'],
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ), //Done
                    //Giza
                    Positioned(
                      top: 280,
                      left: 20,
                      child: BorderedText(
                        strokeColor: Colors.black,
                        strokeWidth: 2,
                        strokeCap: StrokeCap.butt,
                        strokeJoin: StrokeJoin.bevel,
                        child: Text(
                          place['cityName'],
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ), //Done
                    //End Image
                    Positioned(
                      top: 290,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          Scrollable.ensureVisible(dataKey.currentContext!);
                        },
                        child: Container(
                          width: 55,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width: 0.8,
                            ),
                          ),
                          child: ClipRRect(
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    place['images'][0],
                                  ),
                                ),
                                Center(
                                  child: BorderedText(
                                    strokeColor: Colors.black,
                                    strokeWidth: 1.5,
                                    strokeCap: StrokeCap.butt,
                                    strokeJoin: StrokeJoin.bevel,
                                    child: Text(
                                      '+${place['images'].length}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Favourite
                    Positioned(
                      right: 25,
                      top: 10,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            liked = !liked;
                          });
                          if (liked == true) {
                            CacheData.setData(key: likedKey, value: liked);
                            // AuthMethods().addToFavourite(
                            //   context: context,
                            //   docID: docID,
                            //   address: place['address'],
                            //   description: place['description'],
                            //   imageUrl: place['imageUrl'],
                            //   name: place['name'],
                            //   rate: place['rate'],
                            //   cityName: place['cityName'],
                            //   images: place['images'],
                            //   mapUrl: place['mapUrl'],
                            //   openingHours: place['openingHours'],
                            //   tickets: place['tickets'],
                            // );
                          } else {
                            CacheData.setData(key: likedKey, value: liked);
                            AuthMethods().deleteFromFavourite(
                              context: context,
                              docID: docID,
                            );
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: liked ? Colors.red : Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    //Back
                    Positioned(
                      left: 10,
                      top: 10,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kSizedBox,
              //----------------------------------------------------------------
              //location and googleMaps
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //location
                    Container(
                      width: 250,
                      child: Text(
                        widget.placeData[widget.currentIndex]['address'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //google map
                    GestureDetector(
                      onTap: () async {
                        var url = Uri.parse(
                            widget.placeData[widget.currentIndex]['mapUrl']);
                        if (await canLaunchUrl(
                          url,
                        )) {
                          await launchUrl(url);
                        }
                        ;
                      },
                      child: Container(
                        child: Image.asset(
                          'assets/images/googlemaps.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                height: 0.5,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Colors.grey[300],
              ),
              kSizedBox,
              //----------------------------------------------------------------
              //Opening hours
              BuildOpeningHoursItem(
                place: place,
                openFrom: place['openingHours']['from'],
                openTo: place['openingHours']['to'],
              ),
              kSizedBox,
              //Tickets
              BuildTicketsItem(place: place),
              kSizedBox,
              //----------------------------------------------------------------
              //Description and rate
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${widget.placeData[widget.currentIndex]['rate']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Ratings'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kSizedBox,
              // Text in description
              Container(
                height: 45,
                child: SingleChildScrollView(
                  clipBehavior: Clip.hardEdge,
                  controller: ScrollController(),
                  child: Center(
                    child: Text(
                      widget.placeData[widget.currentIndex]['description'],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //----------------------------------------------------------------
              //Images
              Text(
                'Gallery',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              kSizedBox,
              GridView.builder(
                key: dataKey,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                padding: const EdgeInsets.all(1),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(0.5),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PhotoViewPage(
                              photos: place['images'], index: index),
                        ),
                      ),
                      child: Hero(
                        tag: place['images'][index],
                        child: CachedNetworkImage(
                          imageUrl: place['images'][index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Container(color: Colors.grey),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: place['images'].length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
