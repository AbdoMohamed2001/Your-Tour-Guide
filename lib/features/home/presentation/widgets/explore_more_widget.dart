import 'package:your_tour_guide/app_locale.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/cubits/locale_cubit/locale_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ExploreMoreWidget extends StatelessWidget {
  const ExploreMoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).Explore,
              // S.of(context).Explore,
              style: TextStyle(
                fontSize: 28,
                // color: Colors.black,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.brightness_2)),
                //
                IconButton(
                    onPressed: () {
                      HomeCubit.get(context).changeLanguage('ar');
                      HomeCubit.get(context).updateUi();
                    },
                    icon: Icon(Icons.sailing_outlined)),

                PopupMenuButton(
                    icon: Icon(
                      Icons.language,
                    ),
                    itemBuilder: (_) {
                      return [
                        PopupMenuItem(
                          child: Text('Arabic'),
                          onTap: (){

                            BlocProvider.of<HomeCubit>(context)
                                .changeLanguage('ar');
                            // BlocProvider.of<LocaleCubit>(context).restartApp();
                          },
                        ),
                        PopupMenuItem(
                          child: Text('English'),
                          onTap: (){

                            // BlocProvider.of<LocaleCubit>(context).restartApp();
                            BlocProvider.of<HomeCubit>(context)
                                .changeLanguage('en');

                          },

                        ),
                      ];
                    }),
              ],
            ),
          ],
        ),
        // More about Egypt
        Text(
          // 'moreAboutEgypt',
          S.of(context).moreAboutEgypt,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  },
);
  }
}
