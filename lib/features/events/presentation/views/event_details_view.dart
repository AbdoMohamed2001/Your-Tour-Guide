import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/events/domain/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/events/domain/usecases/get_events_usecase.dart';
import 'package:your_tour_guide/features/events/presentation/cubit/event_cubit.dart';
import 'package:your_tour_guide/features/events/presentation/widgets/event_details_view/event_details_view_body.dart';
import '../../../../core/services/get_it_services_locator.dart';

class EventDetailsView extends StatelessWidget {
  EventDetailsView({
    Key? key,
    required this.eventEntity,
  }) : super(key: key);
  final EventEntity eventEntity;
  static final String id = 'EventsDetailsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => EventCubit(getIt<GetEventsUseCase>()),
        child: EventDetailsViewBody(
          eventEntity: eventEntity,
        ),
      ),
    );
  }
}
