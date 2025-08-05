import 'package:your_tour_guide/features/home/presentation/widgets/featured_places_list_view_builder.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/services_grid_view.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/explore_places_widget.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/features_grid_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/cubits/home/home_cubit.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
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
    super.initState();

    if (getIt<HomeCubit>().isPlacesLoaded == false) {
      getIt<HomeCubit>().getFeaturedPlaces();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(kHorizontalPadding),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //---------------------------------------------------------
                //Explore
                const ExploreMore(),
                kSizedBox,
                //---------------------------------------------------------
                //Search Bar
                GestureDetector(
                  onTap: () {
                    getIt<HomeCubit>().changeIndex(1);
                  },
                  child: CustomTextField(
                    labelText: S.of(context).search,
                    prefixIcon: const Icon(Icons.search),
                    textInputType: TextInputType.text,
                    isEnabled: false,
                  ),
                ),
                kSizedBox,

                //----------------------------------------------------------------
              ],
            ),
          ),
        ),
        //-----------------------------------------------------------------
        //FEATURES GRIDVIEW
        const SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: const FeaturesGridView(),
        ),
        //-----------------------------------------------------------------
        const SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSizedBox,
                const ExplorePlacesWidget(),
                kSizedBox,
                //----------------------------------------------------------------
              ],
            ),
          ),
        ),
        //-----------------------------------------------------------------
        //FEATURED PLACES LISTVIEW
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: const FeaturedPlacesListViewBuilder(),
        ),
        //-----------------------------------------------------------------
        kSliverSizedBox,
        //-----------------------------------------------------------------
        //SERVICES TEXT
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver:
              SliverToBoxAdapter(child: HeadText(text: S.of(context).services)),
        ),
        kSliverSizedBox,
        //-----------------------------------------------------------------
        //SERVICES GRIDVIEW
        const SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: const ServicesGridView(),
        ),
        //-----------------------------------------------------------------
      ],
    );
  }
}
