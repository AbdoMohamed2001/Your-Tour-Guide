import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/grid_list_view.dart';
import 'package:your_tour_guide/features/events/domain/entities/event_entity.dart';
import 'package:your_tour_guide/features/events/presentation/cubit/event_cubit.dart';

class EventsViewBuilder extends StatelessWidget {
  const EventsViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        final cubit = context.read<EventCubit>();
        final List<EventEntity> events = cubit.allEvents;
        if (state is EventLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EventFailure) {
          return const Center(child: Text('Failed to load Events'));
        } else {
          return GridListView(list: events, isEvent: true);
        }
      },
    );
  }
}
