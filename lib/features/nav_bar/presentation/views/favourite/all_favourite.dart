import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/features/favourite/data/repos/favourite_repo.dart';
import 'package:your_tour_guide/features/favourite/presentation/cubit/favourtie_cubit.dart';
import 'package:your_tour_guide/features/favourite/presentation/widgets/all_favourite_view_body.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/cubits/home/home_cubit.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';

class AllFavouriteView extends StatelessWidget {
  const AllFavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).Favourite,
        leading: IconButton(
          onPressed: () {
            HomeCubit.get(context).changeIndex(0);
          },
          icon: isArabic()
              ? RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Theme.of(context).primaryColorDark,
                  ),
                )
              : Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Theme.of(context).primaryColorDark,
                ),
        ),
      ),
      body: BlocProvider(
        create: (context) => FavouriteCubit(getIt<FavouriteRepo>()),
        child: AllFavouritesViewBody(),
      ),
    );
  }
}
//Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio: .95 / 1,
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemBuilder: (context, index) => BuildFavouriteWidget(index: index),
//           itemCount: BuildFavouriteWidget.listOfServicesContainerEntity.length,
//         ),
//       ),
