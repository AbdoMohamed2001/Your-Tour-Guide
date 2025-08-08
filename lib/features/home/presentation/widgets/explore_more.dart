import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:your_tour_guide/core/cubits/theme/theme_cubit.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/core/utils/widgets/custom_pop_up_menu.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import '../../../../core/utils/theme/text_styles.dart';

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
                //Change Theme icon
                IconButton(
                  onPressed: () => getIt<ThemeCubit>().toggleTheme(),
                  icon: Icon(
                    getIt<ThemeCubit>().isDarkMode(context)
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                ),
                const SizedBox(width: 8),
                CustomPopUpMenu(
                  onSelected: (langCode) {
                    getIt<LocaleCubit>().changeLanguage(langCode);
                  },
                  currentLanguageCode:
                      getIt<LocaleCubit>().currentLocale.languageCode,
                )
              ],
            ),
          ],
        ),
        // More about Egypt
        Text(
          S.of(context).moreAboutEgypt,
          style: TextStyles.bold28,
        ),
      ],
    );
  }
}
