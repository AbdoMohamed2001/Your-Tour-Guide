import 'package:your_tour_guide/components.dart';
import 'package:your_tour_guide/models/event_model.dart';
import 'package:your_tour_guide/screens/upcomingEvents/upcoming_event_screen.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class AllUpcoming extends StatelessWidget {
  static String id = 'AllUpcoming';

  AllUpcoming({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference upcomingEvents =
        FirebaseFirestore.instance.collection('Events');
    List<EventModel>? eventList;

    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).UpcomingEventsAppbar,
        leading: CustomAppBarIconButton(),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: upcomingEvents.get(),
          builder: (context, snapshot) {
            final List<QueryDocumentSnapshot>? allDocs = snapshot.data?.docs;
            if (allDocs == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            }
            else if (snapshot.connectionState == ConnectionState.done) {
              List<EventModel> eventListt = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                eventListt.add(EventModel.fromJson(snapshot.data!.docs[i]));
                eventList = eventListt;

              }

              return ListView.separated(
                itemBuilder: (context, index) => BuildAllUpcomingEvents(
                  model: eventListt[index],
                  pushedPage: UpcomingEventScreen(
                    model: eventList![index],
                    docID: allDocs[index].id,

                  ),
                ),
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
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
