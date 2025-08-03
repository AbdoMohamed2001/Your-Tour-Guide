import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/events/domain/entities/event_entity.dart';
import 'package:your_tour_guide/features/events/presentation/cubit/event_cubit.dart';

import '../../../../../core/utils/widgets/local_hero/local_hero_body.dart';

class EventsViewBuilder extends StatelessWidget {
  const EventsViewBuilder({super.key, required this.tabController});
  final TabController tabController;
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
          return LocalHeroBody(
            tabController: tabController,
            entities: events,
            isEvent: true,
          );
        }
      },
    );
  }
}
