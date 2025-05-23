import 'package:your_tour_guide/components.dart';
import 'package:your_tour_guide/resources/storage_methods.dart';
import 'package:your_tour_guide/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context); // عشان اخد object

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool isPassObscure = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  //-----------------------------------------------------------------
  String? password;
  String? passwordValue;
  GlobalKey<FormState> registerFormKey = GlobalKey();
  TextEditingController registerUserNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();
  Uint8List? image;
  late ByteData imageData;
  //--------------------------------------------------------

  void changePassIcon() {
    isPassObscure = !isPassObscure;
    emit(AuthChangeObscure());
  }

  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure(
            errMessage: 'no user found for that email please try again'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure(
            errMessage:
                'The password you entered is incorrect please try again'));
      }
    } on Exception catch (e) {
      print(e);
      showToast(msg: e.toString());
    }
  }
//--------------------------------------------------------

  Future<String> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String userName,
    required Uint8List file,
  }) async {
    emit(AuthLoading());
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
        await 'username': userName,
        await 'email': email,
        await 'uid': credential.user!.uid,
        await 'photoUrl': photoUrl,
      });
      showToast(msg: 'Registered Successfully');

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailure(errMessage: 'The password you entered is week'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure(
            errMessage: 'The account already exists for that email'));
      }
    } catch (err) {
      print(err);
      showSnackBar(
        context,
        err.toString(),
      );
      emit(AuthFailure(errMessage: err.toString()));
    }
    return 'null';
  }

//--------------------------------------------------------
  Future<String> signUpUserWithSocial({
    required BuildContext context,
  }) async {
    emit(AuthLoading());
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return 'no value added';
      }
      ;
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      // print('this is User data  :  ${userData!.id}\n');

      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        await 'username': googleUser.displayName,
        await 'email': googleUser.email,
        await 'uid': FirebaseAuth.instance.currentUser?.uid,
        await 'photoUrl': googleUser.photoUrl,
      });
      showToast(msg: 'Registered Successfully');

      emit(AuthSuccess());
    } catch (err) {
      print(err);
      showSnackBar(
        context,
        err.toString(),
      );
      emit(AuthFailure(errMessage: err.toString()));
    }
    return 'null';
  }

//--------------------------------------------------------
  Future<String> signUpUserWithFacebook({
    required BuildContext context,
  }) async {
    emit(AuthLoading());
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      ;
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      UserCredential res = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      User? user = res.user;
      print('this is photo url ${user?.photoURL}');

      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        await 'username': FirebaseAuth.instance.currentUser?.displayName,
        await 'email': FirebaseAuth.instance.currentUser?.email,
        await 'uid': FirebaseAuth.instance.currentUser?.uid,
        await 'photoUrl': user?.photoURL,
      });
      showToast(msg: 'Registered Successfully');

      emit(AuthSuccess());
    } catch (err) {
      print(err);
      showSnackBar(
        context,
        err.toString(),
      );
      emit(AuthFailure(errMessage: err.toString()));
    }
    return 'null';
  }
//--------------------------------------------------------
//--------------------------------------------------------

  void makeDefaultImage() {
    image = imageData.buffer.asUint8List();
    emit(AuthMakeDefaultImage());
  }

  void bundle() {
    rootBundle
        .load('assets/images/user.png')
        .then((data) => this.imageData = data);
    emit(AuthMakeDefaultImageBundle());
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    image = im;
    emit(AuthSelectImage());
  }
}
