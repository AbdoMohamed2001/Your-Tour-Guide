import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/malls/data/repos/mall_repo.dart';
import 'package:your_tour_guide/features/malls/presentation/cubit/mall_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/local_hero/local_hero_app_bar.dart';
import '../../../places/presentation/views/places_view.dart';
import '../widgets/all_malls_view/all_malls_view_body.dart';

class MallsView extends StatefulWidget {
  MallsView({
    Key? key,
    this.cityName,
  }) : super(key: key);
  final String? cityName;

  @override
  State<MallsView> createState() => _MallsViewState();
}

class _MallsViewState extends State<MallsView>
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
        title: S.of(context).Malls,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => MallCubit(getIt<MallRepo>()),
        child: MallsViewBody(
          tabController: _tabController,
          cityName: widget.cityName,
        ),
      ),
    );
  }
}
