import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/mosques/data/repos/mosque_repo.dart';
import 'package:your_tour_guide/features/mosques/presentation/cubit/mosque_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/local_hero/local_hero_app_bar.dart';
import '../../../places/presentation/views/places_view.dart';
import '../widgets/all_mosques_view/all_mosques_view_body.dart';

class MosquesView extends StatefulWidget {
  MosquesView({
    Key? key,
  }) : super(key: key);

  @override
  State<MosquesView> createState() => _MosquesViewState();
}

class _MosquesViewState extends State<MosquesView>
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
        title: S.of(context).Mosques,
      ),
      body: BlocProvider(
        create: (context) => MosqueCubit(getIt<MosqueRepo>()),
        child: MosquesViewBody(tabController: _tabController),
      ),
    );
  }
}
