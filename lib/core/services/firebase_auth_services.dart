import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  Future<User> registerUser(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة السر ضعيفة جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'هذا البريد الإلكتروني مستخدم من قبل ');
      }
      throw CustomExceptions(message: 'هناك خطأ برجاء المحاولة في وقت لاحق');
    } catch (e) {
      throw CustomExceptions(message: 'هناك خطأ برجاء المحاولة في وقت لاحق');
    }
  }

  Future<User> loginUser(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Error in Firebase Auth LoginUser : ${e.toString()}');
      if (e.code == 'user-not-found') {
        throw CustomExceptions(message: 'هذا البريد الإلكتروني غير موجود');
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions(
            message: 'البريد الإلكترونى او كلمة السر غير صحيح');
      } else if (e.code == 'invalid-email') {
        throw CustomExceptions(message: 'صيغة البريد الإلكتروني غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'تحقق من اتصالك بالإنترنت');
      } else if (e.code == 'invalid-credential') {
        throw CustomExceptions(
            message: 'البريد الإلكترونى او كلمة السر غير صحيحة.');
      }
      log('Error in Firebase Auth LoginUser : ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ برجاء المحاولة في وقت لاحق');
    } catch (e) {
      log('Error in Firebase Auth LoginUser : ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ برجاء المحاولة في وقت لاحق');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomExceptions(message: 'هذا الحساب مسجل من قبل');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: 'تحقق من اتصالك بالانترنت');
      }
      log('Firebase Auth Google SignIn Error: ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ برجاء المحاولة في وقت لاحق');
    } catch (e) {
      log('Error in Firebase Auth LoginUser : ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ برجاء المحاولة في وقت لاحق');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Facebook SignIn Error: ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ برجاء المحاولة في وقت لاحق');
    } catch (e) {
      log('Firebase Auth Facebook SignIn Error: ${e.toString()}');
      throw CustomExceptions(message: 'هناك خطأ برجاء المحاولة في وقت لاحق');
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

//-------------------------Update-----------------------------
  Future<void> updateUserName({
    required String userId,
    required String displayName,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user logged in.');
    }
    try {
      await user.updateProfile(displayName: displayName);
    } catch (e) {
      log("Error updating display name in Firebase Auth: $e");
      rethrow;
    }
  }

  Future<void> updateUserEmail({
    required String userId,
    required String email,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('No user logged in.');
    }
    try {
      await user.updateEmail(email);
    } catch (e) {
      log("Error updating display name in Firebase Auth: $e");
      rethrow;
    }
  }
}
