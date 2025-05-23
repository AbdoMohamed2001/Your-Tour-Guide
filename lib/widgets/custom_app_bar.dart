import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utils.dart';

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
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarIconBrightness: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarIconBrightness,));
    return SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 25/2.5,
      ),
      child: Stack(
        children: [
          Positioned.fill(
              child: titleWidget == null ?
              Center(child: Text(
                title,
                style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColorDark,

              ),),)
                  : Center(child: titleWidget,)

          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(offset: const Offset(-14,0),
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


class  CustomAppBarIconButton extends StatelessWidget { 
  const  CustomAppBarIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
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
      ),
    );
    
  }
}

