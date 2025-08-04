import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import '../../../../core/cubits/home/home_cubit.dart';
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
                  onPressed: () => getIt<HomeCubit>().toggleTheme(),
                  icon: Icon(
                    getIt<HomeCubit>().isDarkMode
                        ? Icons.light_mode
                        : Icons.dark_mode,
                  ),
                ),
                const SizedBox(width: 8),
                SimplePopupMenu(
                  onSelected: (langCode) {
                    getIt<HomeCubit>().changeLanguage(langCode);
                  },
                  currentLanguageCode:
                      getIt<HomeCubit>().currentLocale.languageCode,
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

class SimplePopupMenu extends StatelessWidget {
  final Function(String) onSelected;
  final String currentLanguageCode;
  final Widget icon;

  const SimplePopupMenu({
    Key? key,
    required this.onSelected,
    required this.currentLanguageCode,
    this.icon = const Icon(Icons.language),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _showMenu(context, details.globalPosition),
      child: icon,
    );
  }

  void _showMenu(BuildContext context, Offset position) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx + 1,
        position.dy + 1,
      ),
      items: [
        PopupMenuItem(
          value: 'ar',
          child: Row(
            children: [
              const Icon(Icons.language, size: 20),
              const SizedBox(width: 8),
              Text(S.of(context).arabic),
              const Spacer(),
              if (currentLanguageCode == 'ar')
                Icon(Icons.check, size: 16, color: AppColors.primaryColor),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'en',
          child: Row(
            children: [
              const Icon(Icons.language, size: 20),
              const SizedBox(width: 8),
              Text(S.of(context).english),
              const Spacer(),
              if (currentLanguageCode == 'en')
                Icon(Icons.check, size: 16, color: AppColors.primaryColor),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        onSelected(value);
      }
    });
  }
}
