import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/featured_places_list_view_builder.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/services_grid_view.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/widgets/head_text.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/explore_places_widget.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/features_grid_view.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'explore_more.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeCubit>().getFeaturedPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------------------------------------------------------
              //Explore
              ExploreMore(),
              kSizedBox,
              //-----------------------------------------------------------------
              FeaturesGridView(),
              kSizedBox,
              //----------------------------------------------------------------
              ExplorePlacesWidget(),
              kSizedBox,
              //----------------------------------------------------------------
              //Places
              FeaturedPlacesListViewBuilder(),
              kSizedBox,
              //----------------------------------------------------------------
              //Services
              HeadText(text: S.of(context).services),
              kSizedBox,
              ServicesGridView(),
              kSizedBox,
              //----------------------------------------------------------------
            ],
          ),
        ],
      ),
    );
  }
}
