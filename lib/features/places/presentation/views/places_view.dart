import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/core/utils/widgets/local_hero/local_hero_app_bar.dart';

import '../../../../generated/l10n.dart';
import '../../data/repos/places_repo.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../cubit/place_cubit/place_cubit.dart';
import '../widgets/all_places_view/places_view_body.dart';

enum FavoriteShape { grid, list }

class PlacesView extends StatefulWidget {
  const PlacesView({Key? key, this.cityName}) : super(key: key);
  final String? cityName;

  @override
  State<PlacesView> createState() => _PlacesViewState();
}

class _PlacesViewState extends State<PlacesView>
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
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => PlaceCubit(getIt<PlacesRepo>()),
        child: PlacesViewBody(
          tabController: _tabController,
          cityName: widget.cityName,
        ),
      ),
    );
  }
}
