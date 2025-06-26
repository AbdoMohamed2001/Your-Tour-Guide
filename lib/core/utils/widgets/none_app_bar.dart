import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoneAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoneAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0.0),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarIconBrightness,
          statusBarColor: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarColor,
          // statusBarColor: Color(0xfff9f9f9),
        ),
        elevation: 0,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(-0.5);
}
