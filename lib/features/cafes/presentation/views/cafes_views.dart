import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/features/cafes/data/repos/cafe_repo.dart';
import 'package:your_tour_guide/features/cafes/presentation/cubit/cafe_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/local_hero/local_hero_app_bar.dart';
import '../../../places/presentation/views/places_view.dart';
import '../widgets/cafes_views/cafes_view_body.dart';

class CafesView extends StatefulWidget {
  CafesView({
    Key? key,
    this.cityName,
  }) : super(key: key);
  final String? cityName;

  @override
  State<CafesView> createState() => _CafesViewState();
}

class _CafesViewState extends State<CafesView>
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
        title: S.of(context).Cafes,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => CafeCubit(getIt<CafeRepo>()),
        child: CafesViewBody(
          tabController: _tabController,
          cityName: widget.cityName,
        ),
      ),
    );
  }
}
