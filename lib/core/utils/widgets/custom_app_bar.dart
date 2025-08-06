import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.titleWidget,
    this.leading,
  }) : super(key: key);
  final String title;
  final Widget? leading;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Theme.of(context)
          .appBarTheme
          .systemOverlayStyle!
          .statusBarIconBrightness,
    ));
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 25 / 2.5),
      child: Stack(
        children: [
          Positioned(
            child: titleWidget == null
                ? Center(
                    child: Text(
                      title,
                      style: TextStyles.regular18,
                    ),
                  )
                : Center(child: titleWidget),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(
                    offset: const Offset(-14, 0),
                    child: const BackButton(),
                  ),
            ],
          ),
        ],
      ),
    ));
  }

  Size get preferredSize => const Size(double.maxFinite, 60);
}

class CustomAppBarIconButton extends StatelessWidget {
  const CustomAppBarIconButton({Key? key, this.onPressed}) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
      icon: Icon(Icons.arrow_back_ios_new_outlined),
    );
  }
}
