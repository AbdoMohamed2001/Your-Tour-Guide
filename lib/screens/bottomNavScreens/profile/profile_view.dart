import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/screens/bottomNavScreens/profile/edit_profile_view.dart';
import 'package:your_tour_guide/screens/homePage/welcome_view.dart';
import 'package:your_tour_guide/screens/pofile_image_view.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';
import '../../../utils/utils.dart';

class ProfileView extends StatelessWidget {
  static String id = '  ProfileView';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var currentUser = FirebaseAuth.instance.currentUser?.uid;
    var authCubit = HomeCubit.get(context);
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(currentUser).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          var homeCubit = HomeCubit.get(context);
          if (snapshot.data?.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          if (snapshot.data?.data != null) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: 250,
                      child: Image.asset(
                        homeCubit.isDark!
                            ? 'assets/images/edit_profile_dark.png'
                            : 'assets/images/edit_profile.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 95,
                      right: screenWidth * 0.3,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => ProfileImageView(
                          //               imageUrl: data['photoUrl'].toString(),
                          //             )));
                        },
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: DecorationImage(
                              image: NetworkImage(data['photoUrl']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            border: Border.all(
                              color: Colors.white,
                              width: 4.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      child: IconButton(
                        onPressed: () {
                          HomeCubit.get(context).changeIndex(0);
                        },
                        icon: isArabic()
                            ? RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              )
                            : Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Theme.of(context).primaryColorDark,
                              ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      //-------------------------------------------------------------------------
                      //-------------------------------------------------------------------------
                      //Username
                      Row(
                        children: [
                          Container(
                            width: 110,
                            child: Text(
                              S.of(context).UserName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            data['username'],
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //-------------------------------------------------------------------------
                      //Email
                      Row(
                        children: [
                          Container(
                            width: 110,
                            child: Center(
                              child: Text(
                                S.of(context).Email,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            data['email'],
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      //-------------------------------------------------------------------------
                      //Edit profile
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EditProfileView(
                              data: data,
                            );
                          }));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 100.0),
                          child: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              S.of(context).EditProfile,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //-------------------------------------------------------------------------
                      //sign out
                      GestureDetector(
                        onTap: () async {
                          authCubit.emailLogOut();
                          authCubit.facebookLogOut();
                          authCubit.googleLogOut();

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return WelcomeView();
                          }));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 100.0),
                          child: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.orange[300],
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              S.of(context).SignOut,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //-------------------------------------------------------------------------
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('error with data'),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Text('error with data'),
            ),
          );
        },
      ),
    );
  }
}
