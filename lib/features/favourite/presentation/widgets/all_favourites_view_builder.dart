import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/grid_list_view.dart';
import 'package:your_tour_guide/features/favourite/presentation/cubit/favourtie_cubit.dart';

import '../../../../core/utils/functions/navigate_to_services_details_screen.dart';
import '../../../../core/utils/text_styles.dart';

class AllFavouritesViewBuilder extends StatelessWidget {
  const AllFavouritesViewBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is FavouritesGetEntitySuccess) {
          navigateToServiceDetailsScreen(
            state.collectionName,
            context,
            state.entity,
          );
        }
      },
      builder: (context, state) {
        var favList = context.watch<FavouriteCubit>().favs;
        if (state is FavouritesGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavouritesGetFailure) {
          return const Center(child: Text('Failed to load featured places'));
        } else if (favList.isEmpty) {
          return Center(
            child: Text(
              'No Favourites yet',
              style: TextStyles.bold22,
            ),
          );
        } else {
          return GridListView(
            list: favList,
            isFavEntity: true,
          );
        }
      },
    );
  }
}
