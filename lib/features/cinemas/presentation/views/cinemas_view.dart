import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/cinemas/domain/repos/cinema_repo.dart';
import 'package:your_tour_guide/features/cinemas/presentation/cubit/cinema_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/local_hero/local_hero_app_bar.dart';
import '../../../places/presentation/views/places_view.dart';
import '../widgets/cinemas_view/cinemas_view_body.dart';

class CinemasView extends StatefulWidget {
  CinemasView({
    Key? key,
    this.cityName,
  }) : super(key: key);
  final String? cityName;

  @override
  State<CinemasView> createState() => _CinemasViewState();
}

class _CinemasViewState extends State<CinemasView>
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
        title: S.of(context).Cinemas,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => CinemaCubit(getIt<CinemaRepo>()),
        child: CinemasViewBody(
          tabController: _tabController,
          cityName: widget.cityName,
        ),
      ),
    );
  }
}
