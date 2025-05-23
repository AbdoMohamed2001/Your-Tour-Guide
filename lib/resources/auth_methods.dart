import 'dart:developer';

import 'package:your_tour_guide/components.dart';
import 'package:your_tour_guide/resources/storage_methods.dart';
import 'package:your_tour_guide/features/nav_bar/presentation/views/main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteFromFavourite({
    required var docID,
    required BuildContext context,
  }) async {
    late var currentUser = _auth.currentUser;
    CollectionReference _collectionReference =
        FirebaseFirestore.instance.collection('favouritePlaces');
    return _collectionReference
        .doc(currentUser!.email)
        .collection('places')
        .doc(docID)
        .delete()
        .then((value) => showToast(msg: 'Removed From Favourite'));
  }

  //-----------------------------------------------------------------------
  //sign up user
  Future<String> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String userName,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String photoUrl = await StorageMethods()
          .uploadImageToStorage('profilePics', file, false);
      //Store user to database
      _firestore.collection('users').doc(credential.user!.uid).set({
        'username': userName,
        'email': email,
        'uid': credential.user!.uid,
        'photoUrl': photoUrl,
      });
      res = 'Success';
      showToast(msg: 'Registered Successfully');
      Navigator.pushReplacementNamed(context, MainView.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(msg: 'Password is weak');
      } else if (e.code == 'email-already-in-use') {
        showToast(msg: 'The account already exists for that email');
      }
    } catch (err) {
      res = err.toString();
      print(err);
      showSnackBar(
        context,
        err.toString(),
      );
    }
    return res;
  }

//-----------------------------------------------------------------------
  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      showToast(msg: 'logged in Successfully');
      Navigator.pushReplacementNamed(context, MainView.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast(msg: 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        showToast(msg: 'Wrong password provided for that user');
        // print('Wrong password provided for that user.');
      }
    }
  }

//-----------------------------------------------------------------------
  Future<void> anonymousUser() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      log("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          log("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          log("Unknown error.");
      }
    }
  }
//-----------------------------------------------------------------------
}
