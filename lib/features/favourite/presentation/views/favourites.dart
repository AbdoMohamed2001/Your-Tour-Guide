import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/favourite/data/repos/favourite_repo.dart';
import 'package:your_tour_guide/features/favourite/presentation/cubit/favourtie_cubit.dart';
import 'package:your_tour_guide/features/favourite/presentation/widgets/favourites_view_body.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../core/cubits/home/home_cubit.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).Favourite,
        leading: CustomAppBarIconButton(
          onPressed: () {
            HomeCubit.get(context).changeIndex(0);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => FavouriteCubit(getIt<FavouriteRepo>()),
        child: FavouritesViewBody(),
      ),
    );
  }
}
