import 'package:your_tour_guide/generated/l10n.dart';

import 'package:your_tour_guide/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../auth/presentation/views/register_view.dart';

class WelcomeView extends StatelessWidget {
  static String id = 'welcome';

  const WelcomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome.jpg'),
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                children: [
                  //----------------------------------------------------------------
                  const Image(
                    image: AssetImage('assets/images/applogo.png'),
                    width: 160,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //----------------------------------------------------------------
                  // Welcome
                  Text(
                    S.of(context).WELCOMETO,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).TOURGUIDE,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        S.of(context).APP,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //----------------------------------------------------------------
                  //Register
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()));
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
                  SizedBox(
                    height: 20,
                  ),
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
        ),
      ),
    );
  }
}
