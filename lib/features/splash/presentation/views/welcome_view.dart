import 'package:your_tour_guide/features/splash/presentation/widgets/welcome_view_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../generated/assets.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    Key? key,
  }) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesWelcome),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: WelcomeViewBody(),
      ),
    );
  }
}
