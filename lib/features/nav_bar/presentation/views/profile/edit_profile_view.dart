import 'package:your_tour_guide/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class EditProfileView extends StatelessWidget {
  static String id = 'EditProfileView';
  const EditProfileView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;

    var currentUser = FirebaseAuth.instance.currentUser?.uid;
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(-.3),
        child: AppBar(
          backgroundColor: Colors.red,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.orange[300],
          ),
          elevation: 0,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(currentUser).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.data?.data == null) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
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
                        isArabic()
                            ? 'assets/images/edit_profile_dark.png'
                            : 'assets/images/edit_profile.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      child: CustomAppBarIconButton(),
                    ),
                    Positioned(
                      top: 95,
                      right: screenWidth * 0.3,
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: NetworkImage(data['photoUrl'].toString()),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      //-------------------------------------------------------------------------
                      SizedBox(
                        height: 20,
                      ),
                      //-------------------------------------------------------------------------
                      //Username
                      CustomTextField(
                        labelText: data['username'],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //-------------------------------------------------------------------------
                      //Password
                      CustomTextField(
                        labelText: S.of(context).Password,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //-------------------------------------------------------------------------
                      //Confirm Password
                      CustomTextField(
                        labelText: S.of(context).ConfirmPassword,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //-------------------------------------------------------------------------
                      //sign out
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
