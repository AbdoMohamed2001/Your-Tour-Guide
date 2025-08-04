import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/generated/assets.dart';

import '../../../../generated/l10n.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../../../auth/presentation/views/register_view.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: [
              const Image(
                image: AssetImage(Assets.imagesAppLogoNew),
                width: 190,
                height: 210,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 15),
              //----------------------------------------------------------------
              // Welcome
              Text(
                S.of(context).WELCOMETO,
                style: TextStyles.bold18.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).TOURGUIDE,
                    style: TextStyles.bold24.copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Text(
                    S.of(context).APP,
                    style: TextStyles.regular22.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              //----------------------------------------------------------------
              //Login
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: (BorderRadius.circular(20)),
                    color: Colors.white70,
                  ),
                  width: 190,
                  height: 40,
                  child: Center(
                      child: Text(
                    S.of(context).LOGIN,
                    style: TextStyle(color: Colors.black),
                  )),
                ),
              ),
              const SizedBox(height: 20),
              //----------------------------------------------------------------
              //Register
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterView()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: (BorderRadius.circular(20)),
                    color: Colors.white70,
                  ),
                  width: 220,
                  height: 40,
                  child: Center(
                      child: Text(
                    S.of(context).SIGNUP,
                    style: TextStyle(color: Colors.black),
                  )),
                ),
              ),
              SizedBox(height: 20),
              //----------------------------------------------------------------
              //Guest
              // GestureDetector(
              //   onTap: () {
              //     AuthMethods().anonymousUser();
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) {
              //       return HomePage();
              //     }));
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: (BorderRadius.circular(20)),
              //       color: Colors.white70,
              //     ),
              //     width: 190,
              //     height: 40,
              //     child: Center(child: Text('LOGIN AS GUEST')),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
