import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../theme/app_colors.dart';

class CustomPopUpMenu extends StatelessWidget {
  final Function(String) onSelected;
  final String currentLanguageCode;
  final Widget icon;

  const CustomPopUpMenu({
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
