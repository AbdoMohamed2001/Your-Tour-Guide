import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/places/presentation/views/places_view.dart';
import 'package:your_tour_guide/features/places/presentation/widgets/all_best_places_view/all_best_places_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/local_hero/local_hero_app_bar.dart';
import '../../data/repos/places_repo.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../generated/l10n.dart';
import '../cubit/place_cubit/place_cubit.dart';

class BestPlacesView extends StatefulWidget {
  const BestPlacesView({Key? key}) : super(key: key);

  @override
  State<BestPlacesView> createState() => _BestPlacesViewState();
}

class _BestPlacesViewState extends State<BestPlacesView>
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
        title: S.of(context).Places,
      ),
      body: BlocProvider(
        create: (context) => PlaceCubit(getIt<PlacesRepo>()),
        child: BestPlacesViewBody(tabController: _tabController),
      ),
    );
  }
}
