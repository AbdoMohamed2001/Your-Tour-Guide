import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/place_cubit/place_cubit.dart';
import 'package:your_tour_guide/models/event_model.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/hotel/contact_widget.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:your_tour_guide/widgets/place/custom_place_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class UpcomingEventScreen extends StatelessWidget {
  UpcomingEventScreen({
    Key? key,

    required this.model,
    required this.docID,
  }) : super(key: key);
  final EventModel model;
  final docID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => PlaceCubit()
    ..likedKey = docID
    ..restorePersistedPref(),
  child: Scaffold(
      appBar: NoneAppBar(),
      body: BlocBuilder<PlaceCubit, PlaceState>(
  builder: (context, state) {
    var placeCubit = PlaceCubit.get(context);
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-------------------------------------------------
              //Image
              CustomPlaceImage(
                docID: docID,
                imageUrl: model.imageUrl,
                name:
                isArabic() ? model.nameArabic : model.name,
                cityName: '',
                containerImage: model.imageUrl!,
                cubitLikedValue: placeCubit.likedValue,
                favouriteFunction: (){},
                cubitDataKeyCurrentContext:
                placeCubit.dataKey.currentContext,
                images: [],
              ),
              // CustomImageWithoutEndImage(
              //   dataKey: dataKey,
              //   imagesLength: widget.upcomingEventData.length.toString(),
              //   fontSize: 18,
              //   imageUrl: upcomingEvent['imageUrl'],
              //   itemName: upcomingEvent['name'],
              //   itemLocation: upcomingEvent['location'],
              // ),
              kSizedBox,
              //-------------------------------------------------
              //Date
              Row(
                children: [
                  Image.asset(
                    'assets/images/calendar.png',
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Start Date:  ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            model.startDate!,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            'End Date',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            model.endDate!,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              kSizedBox,
              kDivider,
              kSmallSizedBox,
              //-------------------------------------------------
              //about
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About',
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
                      child: Center(),
                    ),
                  ],
                ),
              ),
              kSmallSizedBox,
              // Text in about
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 80,
                  child: SingleChildScrollView(
                    clipBehavior: Clip.hardEdge,
                    controller: ScrollController(),
                    child: Center(
                      child: Text(
                        model.about!,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              kSizedBox,
              //-------------------------------------------------
              //contact
              ContactWidget(model: model, cubit: placeCubit),
              // const Text(
              //   'Contact',
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              // //Contact website and phone number
              // Container(
              //   width: double.infinity,
              //   color: const Color(0xfff1f1f1),
              //   height: 70,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         //WebSite
              //         GestureDetector(
              //       onTap: (){},
              //           // onTap: () async {
              //           //   setState(() {
              //           //     _launched = _launchInBrowser(toLaunch);
              //           //   });
              //           // },
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.laptop,
              //                 size: 22,
              //               ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Text(
              //                 'WebSite',
              //                 style: TextStyle(
              //                   decoration: TextDecoration.underline,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               Padding(
              //                 padding:
              //                     const EdgeInsets.only(bottom: 3.0, left: 2),
              //                 child: Icon(
              //                   Icons.north_east,
              //                   size: 13,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         //------------------------------------
              //         //Email
              //         GestureDetector(
              //           onTap: () async {
              //             String? encodeQueryParameters(
              //                 Map<String, String> params) {
              //               return params.entries
              //                   .map((MapEntry<String, String> e) =>
              //                       '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
              //                   .join('&');
              //             }
              //
              //             final Uri emailUrl = Uri(
              //               scheme: 'mailto',
              //               path: 'abdo.mohammed1778@gmail.com',
              //               query: encodeQueryParameters(<String, String>{
              //                 'subject':
              //                     'Example Subject & Symbols are allowed!',
              //               }),
              //             );
              //             //'mailto:${toEmail}?subject=${Uri.encodeFull(subject)}&body=${message}';
              //             if (await canLaunchUrl(emailUrl)) {
              //               await launchUrl(emailUrl);
              //             }
              //           },
              //           child: Row(
              //             children: [
              //               Icon(Icons.email_outlined,
              //               size: 22,
              //               ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Text(
              //                 'Email',
              //                 style: TextStyle(
              //                   decoration: TextDecoration.underline,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               Padding(
              //                 padding:
              //                     const EdgeInsets.only(bottom: 3.0, left: 2),
              //                 child: Icon(
              //                   Icons.north_east,
              //                   size: 13,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         //------------------------------------
              //         //Phone Number
              //         GestureDetector(
              //           onTap: (){},
              //           // onTap: _hasCallSupport
              //           //     ? () => setState(() {
              //           //           _launched =
              //           //               _makePhoneCall(upcomingEvent['phone']);
              //           //         })
              //           //     : null,
              //           child: Row(
              //             children: [
              //               Icon(Icons.phone,
              //               size: 22,
              //               ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Text(
              //                 model.phone!.toString(),
              //                 style: TextStyle(
              //                   decoration: TextDecoration.underline,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         //------------------------------------
              //       ],
              //     ),
              //   ),
              // ),
              // kSizedBox,
              //-------------------------------------------------
              //inclusions
              Text(
                'Inclusions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //TODO Add Inclusions



              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Inclusions(
              //       icon: Icons.done,
              //       iconColor: Colors.green,
              //       index: 0,
              //         upcomingEvent: upcomingEvent,
              //     exclusionsOrInclusion: 'inclusions',
              //     ),
              //     Inclusions(
              //       icon: Icons.done,
              //       iconColor: Colors.green,
              //       index: 1,
              //         upcomingEvent: upcomingEvent,
              //     exclusionsOrInclusion: 'inclusions',
              //     ),
              //     Inclusions(
              //       icon: Icons.done,
              //       iconColor: Colors.green,
              //       index: 2,
              //         upcomingEvent: upcomingEvent,
              //     exclusionsOrInclusion: 'inclusions',
              //     ),
              //     Inclusions(
              //       icon: Icons.done,
              //       iconColor: Colors.green,
              //       index: 3,
              //         upcomingEvent: upcomingEvent,
              //     exclusionsOrInclusion: 'inclusions',
              //     ),
              //     Inclusions(
              //       icon: Icons.done,
              //       iconColor: Colors.green,
              //       index: 4,
              //         upcomingEvent: upcomingEvent,
              //     exclusionsOrInclusion: 'inclusions',
              //     ),
              //
              //   ],
              // ),
              kSizedBox,
              kSmallSizedBox,
              //-------------------------------------------------
              //Exclusions
              Text(
                'Exclusions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //TODO ADD Exclusions
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Inclusions(
              //       icon: Icons.close,
              //         iconColor: Colors.red,
              //         index: 0,
              //         upcomingEvent: upcomingEvent,
              //       exclusionsOrInclusion: 'exclusions',
              //     ),
              //     Inclusions(
              //       icon: Icons.close,
              //       iconColor: Colors.red,
              //         index: 1,
              //         upcomingEvent: upcomingEvent,
              //       exclusionsOrInclusion: 'exclusions',
              //     ),
              //     Inclusions(
              //       icon: Icons.close,
              //       iconColor: Colors.red,
              //
              //       index: 2,
              //         upcomingEvent: upcomingEvent,
              //       exclusionsOrInclusion: 'exclusions',
              //     ),
              //     Inclusions(
              //       icon: Icons.close,
              //       iconColor: Colors.red,
              //
              //       index: 3,
              //         upcomingEvent: upcomingEvent,
              //       exclusionsOrInclusion: 'exclusions',
              //     ),
              //
              //   ],
              // ),
              kSizedBox,
              kSmallSizedBox,
              //-------------------------------------------------
              // organizer
              Row(
                children: [
                  Text(
                    'More information :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var url = Uri.parse(model.website!);
                      if (await canLaunchUrl(
                        url,
                      )) {
                        await launchUrl(url);
                      }
                      ;
                    },
                    child: Image.network(
                      'https://www.tripsinegypt.com/wp-content/uploads/2022/11/trips-in-egypt-logo.png',
                      width: 120,
                      height: 70,
                    ),
                  )
                ],
              ),
              kSizedBox,
              //-------------------------------------------------
            ],
          ),
        ),
      );
  },
),
    ),
);
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen({
    Key? key,
    required this.upcomingEventData,
    required this.currentIndex,
  }) : super(key: key);

  List<QueryDocumentSnapshot> upcomingEventData;
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              upcomingEventData[currentIndex]['images'][1],
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}


