import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/featured_places_list_view_builder.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/services_grid_view.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/explore_places_widget.dart';
import 'package:your_tour_guide/features/home/presentation/widgets/features_grid_view.dart';
import 'package:flutter/material.dart';
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

    context.read<HomeCubit>().getFeaturedPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
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
              //Search Bar
              GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().changeIndex(1);
                },
                child: CustomTextField(
                  labelText: S.of(context).search,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  textInputType: TextInputType.text,
                  isEnabled: false,
                ),
              ),
              kSizedBox,
              //----------------------------------------------------------------
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
