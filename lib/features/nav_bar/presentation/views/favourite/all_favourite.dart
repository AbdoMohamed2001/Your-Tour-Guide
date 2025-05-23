import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/favourite_widget.dart';
import 'package:flutter/material.dart';

class AllFavouriteView extends StatelessWidget {
  const AllFavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).Favourite ,
        leading: IconButton(
          onPressed: (){
            HomeCubit.get(context).changeIndex(0);
          },
          icon:  isArabic()? RotatedBox(
            quarterTurns: 2,
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Theme.of(context).primaryColorDark,
            ),
          ) :Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).primaryColorDark,
          ),        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .95 / 1,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) =>
              BuildFavouriteWidget(index: index),
          itemCount: BuildFavouriteWidget.listOfItemModel.length,
        ),
      ),
    );
  }
}




