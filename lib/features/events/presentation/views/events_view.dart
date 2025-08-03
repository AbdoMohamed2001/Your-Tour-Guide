import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/events/domain/usecases/get_events_usecase.dart';
import 'package:your_tour_guide/features/events/presentation/cubit/event_cubit.dart';
import 'package:your_tour_guide/features/events/presentation/widgets/all_events_view/events_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/local_hero/local_hero_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../places/presentation/views/places_view.dart';

class EventsView extends StatefulWidget {
  EventsView({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ValueNotifier<FavoriteShape> _viewModeNotifier;

  @override
  void initState() {
    super.initState();
    _viewModeNotifier = ValueNotifier(FavoriteShape.grid);
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      _viewModeNotifier.value =
          _tabController.index == 0 ? FavoriteShape.grid : FavoriteShape.list;
    }
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_handleTabChange)
      ..dispose();
    _viewModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LocalHeroAppBar(
        tabController: _tabController,
        title: S.of(context).UpcomingEventsAppbar,
      ),
      body: BlocProvider(
        create: (context) => EventCubit(getIt<GetEventsUseCase>()),
        child: EventsViewBody(tabController: _tabController),
      ),
    );
  }
}
