import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/generated/l10n.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../cubits/home/home_cubit.dart';

class ExploreMore extends StatelessWidget {
  const ExploreMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).Explore, style: TextStyles.bold28),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (HomeCubit.get(context).isDark == true) {
                      HomeCubit.get(context).changeThemeMode(true);
                    } else {
                      HomeCubit.get(context).changeThemeMode(false);
                    }
                  },
                  icon: Icon(Icons.dark_mode),
                ),
                //
                PopupMenuButton(
                    icon: Icon(
                      Icons.language,
                    ),
                    itemBuilder: (_) {
                      return [
                        PopupMenuItem(
                          child: Text('Arabic'),
                          onTap: () {
                            context.read<HomeCubit>().changeLanguage('ar');
                          },
                        ),
                        PopupMenuItem(
                          child: Text('English'),
                          onTap: () {
                            context.read<HomeCubit>().changeLanguage('en');
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
  }
}
