import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/events/presentation/cubit/event_cubit.dart';
import 'package:your_tour_guide/features/events/presentation/widgets/all_events_view/events_view_builder.dart';

class EventsViewBody extends StatefulWidget {
  const EventsViewBody({super.key});

  @override
  State<EventsViewBody> createState() => _EventsViewBodyState();
}

class _EventsViewBodyState extends State<EventsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return EventsViewBuilder();
  }
}
