import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/events/domain/usecases/get_events_usecase.dart';
import 'package:your_tour_guide/features/events/presentation/cubit/event_cubit.dart';
import 'package:your_tour_guide/features/events/presentation/widgets/all_events_view/events_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/get_it_services_locator.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../generated/l10n.dart';

class EventsView extends StatelessWidget {
  static String id = 'EventsView';

  EventsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).UpcomingEventsAppbar,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => EventCubit(getIt<GetEventsUseCase>()),
        child: EventsViewBody(),
      ),
    );
  }
}
//FutureBuilder<QuerySnapshot>(
//           future: upcomingEvents.get(),
//           builder: (context, snapshot) {
//             final List<QueryDocumentSnapshot>? allDocs = snapshot.data?.docs;
//             if (allDocs == null) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.orange,
//                 ),
//               );
//             } else if (snapshot.connectionState == ConnectionState.done) {
//               List<EventModel> eventListt = [];
//               for (int i = 0; i < snapshot.data!.docs.length; i++) {
//                 eventListt.add(EventModel.fromJson(snapshot.data!.docs[i]));
//                 eventList = eventListt;
//               }
//
//               return ListView.separated(
//                 itemBuilder: (context, index) => BuildEventsViewEvents(
//                   model: eventListt[index],
//                   pushedPage: UpcomingEventScreen(
//                     model: eventList![index],
//                     docID: allDocs[index].id,
//                   ),
//                 ),
//                 itemCount: snapshot.data!.docs.length,
//                 separatorBuilder: (context, index) => SizedBox(
//                   height: 20,
//                 ),
//               );
//             } else if (snapshot.connectionState == ConnectionState.none) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.orange,
//                 ),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Colors.orange,
//               ),
//             );
//           }),
