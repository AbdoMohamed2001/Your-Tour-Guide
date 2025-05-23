import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddField extends StatelessWidget {
  const AddField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('restaurants');
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<QuerySnapshot>(
          future: collectionReference.get(),
          builder: (context, snapshot) {
            final List<QueryDocumentSnapshot>? allDocs = snapshot.data?.docs;
            if (allDocs == null) {
              Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                // print(allDocs[i].id);
                // final String cityName = 'Cairo';
                // addFieldFunction(
                //   docID: allDocs[i].id,
                //   context: context,
                //   allDocs: allDocs,
                //   index: i,
                // );

                // DocumentReference copyFrom = FirebaseFirestore.instance
                //     .collection('restaurants')
                //     .doc(allDocs[i].id);
                // DocumentReference copyTo = FirebaseFirestore.instance
                //     .collection('restaurantsTest')
                //     .doc(allDocs[i].id);
                // copyFrom.get().then((value) => {copyTo.set(value.data())});

                // addDocIdToHotel(
                //   docID: allDocs[i].id,
                //   context: context,
                //   allDocs: allDocs,
                //   index: i,
                // );



                // addDocIdToCinemaCollection(
                //   docID: allDocs[i].id,
                //   context: context,
                //   allDocs: allDocs,
                //   index: i,
                // );



                addDocIdToRestaurantCollection(
                  docID: allDocs[i].id,
                  context: context,
                  allDocs: allDocs,
                  index: i,
                );

                // addDocIdToMallCollection(
                //   collectionName: 'churchs',
                //   docID: allDocs[i].id,
                //   context: context,
                //   allDocs: allDocs,
                //   index: i,
                // );

                // DocumentReference copyFrom = FirebaseFirestore.instance.collection('cities').doc('Sharm El-Sheikh').collection('Malls').doc(allDocs[i].id);
                // DocumentReference copyTo = FirebaseFirestore.instance.collection('malls').doc('Sharm ${allDocs[i].id}');
                // copyFrom.get().then((value) => {
                //   copyTo.set(value.data())
                // });

                // add docId field to restaurant
                // addRestaurantToFavourite(
                //     docID: allDocs[i].id,
                //     context: context,
                //     allDocs: allDocs,
                //     index: i,
                //
                // );
                // -----------------------------------------------------------------------

                //--------------------------------------------------------------------------------


              }
              //-------------------------------------------------------------------------
              return ListView.separated(
                itemBuilder: (context, index) => Container(
                  child: Center(
                    child: Text(allDocs[index]['docId']),
                  ),
                ),
                // itemCount: placeList.length,
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, index) => SizedBox(height: 20),
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }),
    );
  }
}

Future<void> addDocIdToHotel({
  required var docID,
  required BuildContext context,
  required List<QueryDocumentSnapshot>? allDocs,
  required int index,
}) async {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('hotels');
  return _collectionReference
      .doc(docID)
      .set({
        "about":          allDocs![index]['about'],
        "aboutArabic":    allDocs[index]['aboutArabic'],
        "address":        allDocs[index]['address'],
        "addressArabic":  allDocs[index]['addressArabic'],
        "averagePrice":   allDocs[index]['averagePrice'],
        'cityName':       allDocs[index]['cityName'],
        'cityNameArabic': allDocs[index]['cityNameArabic'],
        "distanceTo":allDocs[index]['distanceTo'],
        "distanceToArabic":[
          {
            "airPort": ""
          },
          {
            "cityCenter": ""
          }
        ],

        'docId':          allDocs[index].id,
        "email":          allDocs[index]['email'],
        "features":       allDocs[index]['features'],
        "featuresArabic": allDocs[index]['featuresArabic'],
        'imageUrl':       allDocs[index]['imageUrl'],
        'images':         allDocs[index]['images'],
        'mapUrl':         allDocs[index]['mapUrl'],
        'name':           allDocs[index]['name'],
        'nameArabic':     allDocs[index]['nameArabic'],
        "nearlyTo": {
      {"places": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"restaurants": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"cafes": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"mosques": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"churchs": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"malls": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"cinemas": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},

    },
        "nearlyToArabic": {
      {"places": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"restaurants": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"cafes": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"mosques": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"churchs": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"malls": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},
      {"cinemas": [
        {
          "name" : "",
          "docId":"",
          "distance":""
        },


      ]},

    },
        "noOfFloors":allDocs[index]['noOfFloors'],
        "noOfRooms":allDocs[index]['noOfRooms'],

        'phone':          allDocs[index]['phone'],
        'rate':           allDocs[index]['rate'],
        "roomFacilities": allDocs[index]['roomFacilities'],
        "roomFacilitiesArabic": allDocs[index]['roomFacilitiesArabic'],
        "rooms": allDocs[index]['rooms'],
        "roomsArabic": allDocs[index]['roomsArabic'],
        'stars':          allDocs[index]['stars'],
        'webSite':  "",
        'socialMedia':{
          "facebook" : "",
          "instagram":"",
          "twitter":"",
    },
        'book':{
          "booking" : "",
          "agoda":"",
          "booked":"",
          "kayak":"",
    }







  })
      .then((value) {})
      .onError((error, stackTrace) {
        debugPrint(error.toString());
      });
}

Future<void> addFieldFunction({
  required var docID,
  required BuildContext context,
  required List<QueryDocumentSnapshot>? allDocs,
  required int index,
}) async {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('places');
  final bool isBest = false;

  return _collectionReference.doc(docID).set({
    "address":            allDocs![index]['address'],
    "addressArabic":      allDocs[index]['addressArabic'],
    'cityName':           allDocs[index]['cityName'],
    'cityNameArabic':     allDocs[index]['cityNameArabic'],
    'description':        allDocs[index]['description'],
    'descriptionArabic':  allDocs[index]['descriptionArabic'],
    'docId':              allDocs[index].id,
    'imageUrl':           allDocs[index]['imageUrl'],
    'images':             allDocs[index]['images'],
    "isBest":             allDocs[index]['isBest'],
    'mapUrl':             allDocs[index]['mapUrl'],
    "metroImageUrl":      allDocs[index]['metroImageUrl'],
    'name':               allDocs[index]['name'],
    'nameArabic':         allDocs[index]['nameArabic'],
    'openingHours':       allDocs[index]['openingHours'],
    "openingHoursArabic": allDocs[index]['openingHoursArabic'],
    'rate':               allDocs[index]['rate'],
    'tickets':            allDocs[index]['tickets'],
    "ticketsArabic":      allDocs[index]['ticketsArabic'],
    "includeTour":        allDocs[index]['includeTour'],
    "tourDocId":          allDocs[index]['tourDocId'],
    "transport": {
      "metro": "",
      "transport": []
    },
    "transportArabic": {
      "metro": "",
      "transport": []
    }
  }).then((value) {
    print('added Successfuly');
  }).onError((error, stackTrace) {
    print('error is $error');
  });
}

Future<void> addDocIdToRestaurantCollection({
  required var docID,
  required BuildContext context,
  required List<QueryDocumentSnapshot>? allDocs,
  required int index,
}) async {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('restaurants');
  return _collectionReference
      .doc(docID)
      .set({
        "address": allDocs![index]['address'],
        "addressArabic": '',
        'cityName': allDocs[index]['cityName'],
        'cityNameArabic': allDocs[index]['cityName'] == 'Cairo'
            ? "القاهره"
            : allDocs[index]['cityName'] == 'Sharm El-Sheikh'
                ? 'شرم الشيخ'
                : allDocs[index]['cityName'] == 'Luxor'
                    ? 'الاقصر'
                    : allDocs[index]['cityName'] == 'Alexandria'
                        ? 'الاسكندريه'
                        : allDocs[index]['cityName'] == 'Farafra'
                            ? 'الفرافره'
                            : "الجيزه",
    'docId': allDocs[index].id,
    'email': allDocs[index]['email'],
        'imageUrl': allDocs[index]['imageUrl'],
        'images': allDocs[index]['images'],
        'mapUrl': allDocs[index]['mapUrl'],
        'meals': allDocs[index]['meals'],
        'mealsArabic': allDocs[index]['mealsArabic'],
        'menuImages': allDocs[index]['menuImages'],
        'name': allDocs[index]['name'],
        'nameArabic': allDocs[index]['nameArabic'],
        'openingHours': allDocs[index]['openingHours'],
        'openingHoursArabic': allDocs[index]['openingHoursArabic'],
        'phone': allDocs[index]['phone'],
        'rate': allDocs[index]['rate'],
        'type': allDocs[index]['type'],
        'typeArabic': allDocs[index]['typeArabic'],
        'socialMedia':{
      "facebook" : "",
      "instagram":"",
      "twitter":"",
    },
        'webSite': '',

    'branches':[
          {
            "name":allDocs[index]['name'],
            "location":"",
            "cityName":"",
            "imageUrl":"",
          },
        ],
        'branchesArabic':[
          {
            "name":allDocs[index]['nameArabic'],
            "location":"",
            "cityName":"",
            "imageUrl":"",
          },
        ],
      })
      .then((value) {})
      .onError((error, stackTrace) {
        debugPrint(error.toString());
      });
}

Future<void>  addDocIdToMallCollection({
  required var docID,
  required BuildContext context,
  required List<QueryDocumentSnapshot>? allDocs,
  required int index,
  required String collectionName,
}) async {
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(collectionName);
  return _collectionReference
      .doc(docID)
      .set({
        "address": allDocs![index]['address'],
        "addressArabic": '',
        'cityName': allDocs[index]['cityName'],
    'cityNameArabic': allDocs[index]['cityName'] == 'Cairo'
        ? "القاهره"
        : allDocs[index]['cityName'] == 'Sharm El-Sheikh'
        ? 'شرم الشيخ'
        : allDocs[index]['cityName'] == 'Luxor'
        ? 'الاقصر'
        : allDocs[index]['cityName'] == 'Alexandria'
        ? 'الاسكندريه'
        : allDocs[index]['cityName'] == 'Farafra'
        ? 'الفرافره'
        : "الجيزه",
        'description': allDocs[index]['description'],
        'descriptionArabic': '',
        'imageUrl': allDocs[index]['imageUrl'],
        'images': allDocs[index]['images'],
        'mapUrl': allDocs[index]['mapUrl'],
        'name': allDocs[index]['name'],
        'nameArabic': '',
        'openingHours': allDocs[index]['openingHours'],
        'openingHoursArabic': allDocs[index]['openingHours'],
        'rate': 5,
        'docId': allDocs[index].id,
      })
      .then((value) {})
      .onError((error, stackTrace) {
        debugPrint(error.toString());
      });
}

//--------------------------------------------------------
Future<void> addDocIdToCinemaCollection({
  required var docID,
  required BuildContext context,
  required List<QueryDocumentSnapshot>? allDocs,
  required int index,
}) async {
  CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('cinemas');
  return _collectionReference
      .doc(docID)
      .set({
    "address":  allDocs![index]['address'],
    "addressArabic":  allDocs![index]['addressArabic'],
    'cityName':  allDocs[index]['cityName'],
    'cityNameArabic': allDocs[index]['cityName'] == 'Cairo'
        ? "القاهره"
        : allDocs[index]['cityName'] == 'Sharm El-Sheikh'
        ? 'شرم الشيخ'
        : allDocs[index]['cityName'] == 'Luxor'
        ? 'الاقصر'
        : allDocs[index]['cityName'] == 'Alexandria'
        ? 'الاسكندريه'
        : allDocs[index]['cityName'] == 'Farafra'
        ? 'الفرافره'
        : "الجيزه",
    'imageUrl':  allDocs[index]['imageUrl'],
    'name':  allDocs[index]['name'],
    'nameArabic':  allDocs[index]['nameArabic'],
    'rate':  allDocs[index]['rate'],
    'images':  allDocs[index]['images'],
    'mapUrl':  allDocs[index]['mapUrl'],
    'openingHours':  allDocs[index]['openingHours'],
    'openingHoursArabic':  allDocs[index]['openingHoursArabic'],
    'tickets':  allDocs[index]['tickets'],
    'ticketsArabic':  allDocs[index]['ticketsArabic'],
    'phone':  allDocs[index]['phone'],
    'website':  allDocs[index]['website'],
    'docId':  allDocs[index].id,
    "films": [
      {
        "description": "The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.",
        "imageUrl": "https://sportshub.cbsistatic.com/i/2023/05/05/75a5162e-60b8-4bf4-9902-3c0ef49af85f/oppenheimer-poster-cillian-murphy.jpg?auto=webp&width=1500&height=2375&crop=0.632:1,smart",
        "language": "English",
        "name": "Oppenheimer",
        "rate": 8.7,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",
      },
      {
        "description": "Ethan Hunt and his IMF team must track down a dangerous weapon before it falls into the wrong hands.",
        "imageUrl": "https://media.finnkino.fi/1012/Event_13731/portrait_large/MI7DRP1_1080_uusi.jpg",
        "language": "English",
        "name": "Mission: Impossible _b Dead Reckoning",
        "rate": 8.3,
        "price" : "EGP 100",
        "category" : "Action - Adventure - Thriller",
        "country" : "",
        "trailerUrl" : "",
        "length" : "2h 43m",
        "cast" : ["","",""],
        "length" : "",

      },
      {
        "description": "When a private family event gets leaked on social media, Ibrahim Al Ruby decides to live in a village with his wife and children, far from people and the pressure of modern life. After his younger brother, Ihab, convinces Ibrahim to go back to the city for some important paperwork, the family embarks on a trip full of surprises that is bound to change the lives of the Rubies.",
        "imageUrl": "https://imgix.hoyts.com.au/movies/posters/beit-el-ruby.png",
        "language": "Arabic",
        "name": "Beit El Ruby",
        "rate": 7,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",
      },
      {
        "description": "A music teacher suddenly begins displaying superpowers and attempts to hide them, until the public needs his help.",
        "imageUrl": "https://www.elaosboa.com/wp-content/uploads/2023/06/elaosboa48052-2.jpg",
        "language": "Arabic",
        "name": "TAG",
        "rate": 5.1,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",

      },
      {
        "description": "Farid' is a does not appear hero who is famous for Mr.Ex Men are looking for him to help them divorce their wives, but things turn upside down once 'Tiba Al-Akkad' appears his old love, The storyline revolves in form comedy and action.",
        "imageUrl": "https://m.media-amazon.com/images/M/MV5BMWY3MzJiOGUtMjQ1OC00MmZkLWEwODctMTc1MTI2NjgxYTY1XkEyXkFqcGdeQXVyMTI1OTkzMzQ5._V1_FMjpg_UX1000_.jpg",
        "language": "Arabic",
        "name": "MR.EX",
        "rate": 5.3,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",


      },
      {
        "description":"The Lamberts must go deeper into The Further than ever before to put their demons to rest once and for all.",
        "imageUrl": "https://thefanboyseo.com/wp-content/uploads/2023/04/Insidious-The-Red-Door.jpg",
        "language": "English",
        "name": "Insidious: The Red Door",
        "rate": 6.0,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",

      },
    ],
    "filmsArabic": [
      {
        "description": "The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.",
        "imageUrl": "https://sportshub.cbsistatic.com/i/2023/05/05/75a5162e-60b8-4bf4-9902-3c0ef49af85f/oppenheimer-poster-cillian-murphy.jpg?auto=webp&width=1500&height=2375&crop=0.632:1,smart",
        "language": "English",
        "name": "Oppenheimer",
        "rate": 8.7,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",
      },
      {
        "description": "Ethan Hunt and his IMF team must track down a dangerous weapon before it falls into the wrong hands.",
        "imageUrl": "https://media.finnkino.fi/1012/Event_13731/portrait_large/MI7DRP1_1080_uusi.jpg",
        "language": "English",
        "name": "Mission: Impossible - Dead Reckoning Part One",
        "rate": 8.3,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",
      },
      {
        "description": "عندما يتم تسريب حدث عائلي خاص على وسائل التواصل الاجتماعي ، يقرر إبراهيم الروبي العيش في قرية مع زوجته وأطفاله ، بعيدًا عن الناس وضغط الحياة العصرية. بعد أن أقنع شقيقه الأصغر إيهاب إبراهيم بالعودة إلى المدينة للقيام ببعض الأعمال الورقية المهمة ، تنطلق العائلة في رحلة مليئة بالمفاجآت التي لا بد أن تغير حياة الياقوت..",
        "imageUrl": "https://imgix.hoyts.com.au/movies/posters/beit-el-ruby.png",
        "language": "عربي",
        "name": "بيت الروبي",
        "rate": 7.0,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",
      },
      {
        "description": "A music teacher suddenly begins displaying superpowers and attempts to hide them, until the public needs his help.",
        "imageUrl": "https://www.elaosboa.com/wp-content/uploads/2023/06/elaosboa48052-2.jpg",
        "language": "Arabic",
        "name": "TAG",
        "rate": 5.1,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",

      },
      {
        "description": "Farid' is a does not appear hero who is famous for Mr.Ex Men are looking for him to help them divorce their wives, but things turn upside down once 'Tiba Al-Akkad' appears his old love, The storyline revolves in form comedy and action.",
        "imageUrl": "https://m.media-amazon.com/images/M/MV5BMWY3MzJiOGUtMjQ1OC00MmZkLWEwODctMTc1MTI2NjgxYTY1XkEyXkFqcGdeQXVyMTI1OTkzMzQ5._V1_FMjpg_UX1000_.jpg",
        "language": "Arabic",
        "name": "MR.EX",
        "rate": 5.3,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",

      },
      {
        "description":"The Lamberts must go deeper into The Further than ever before to put their demons to rest once and for all.",
        "imageUrl": "https://thefanboyseo.com/wp-content/uploads/2023/04/Insidious-The-Red-Door.jpg",
        "language": "English",
        "name": "Insidious: The Red Door",
        "rate": 6.0,
        "price" : "EGP 100",
        "category" : "",
        "country" : "",
        "trailerUrl" : "",
        "cast" : ["","",""],
        "length" : "",

      },

    ],

  }).then((value) {
  }  ).onError((error, stackTrace) {

  });
}
//
//----------------------------------------------------------
