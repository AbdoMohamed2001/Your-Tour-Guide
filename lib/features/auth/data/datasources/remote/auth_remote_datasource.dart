import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_tour_guide/core/utils/backend_endpoints.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/database_services.dart';
import '../../../../../core/services/firebase_auth_services.dart';
import '../../models/user_create_req_model.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);

  Future<UserModel> register(UserCreateReqModel user);

  Future<void> signOut();

  Either<Failure, bool> isLogged();

  //--------------------------------
  Future<UserModel> loginWithGoogle();

  Future<UserModel> loginWithFacebook();

  Future<UserModel> loginWithTwitter();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices fireStoreServices;

  AuthRemoteDataSourceImpl(this.firebaseAuthService, this.fireStoreServices);

//----------------------------- Main Methods --------------------------------

  @override
  Future<UserModel> login(String email, String password) async {
    var user =
        await firebaseAuthService.loginUser(email: email, password: password);
    UserModel userModel = await getUserData(userId: user.uid);
    return userModel;
  }

  @override
  Future<UserModel> register(UserCreateReqModel user) async {
    User? userCredential;
    userCredential = await firebaseAuthService.registerUser(
      email: user.email,
      password: user.password,
    );
    UserModel userModel = UserModel(
      id: userCredential.uid,
      name: user.name,
      email: user.email,
      imageUrl:
          'https://img.freepik.com/premium-vector/character-avatar-isolated_729149-194801.jpg',
    );
    await fireStoreServices.addData(
      path: BackEndEndPoints.userCollection,
      recordId: userCredential.uid,
      data: userModel.toJson(),
    );
    return userModel;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthService.signOut();
  }

  @override
  Either<Failure, bool> isLogged() {
    try {
      if (firebaseAuthService.isLoggedIn()) {
        return right(true);
      }
      return right(false);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

//------------------------------- Social Login-------------------------------
  @override
  Future<UserModel> loginWithFacebook() async {
    var user = await firebaseAuthService.signInWithFacebook();
    UserModel? existingUser = await _checkIfUserExists(user.uid);

    if (existingUser == null) {
      return await _createSocialUser(user);
    }

    return existingUser;
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    // 1. Sign in with Google using FirebaseAuth
    var user = await firebaseAuthService.signInWithGoogle();
    // 2. Check if user exists in Firestore
    UserModel? existingUser = await _checkIfUserExists(user.uid);
    // 3. If user doesn't exist, create new user document
    if (existingUser == null) {
      return await _createSocialUser(user);
    }
    // 4. Return existing user data
    return existingUser;
  }

  @override
  Future<UserModel> loginWithTwitter() {
    // TODO: implement loginWithTwitter
    throw UnimplementedError();
  }

//------------------------------ Helper Methods------------------------------
  Future<UserModel> getUserData({required String userId}) async {
    var data = await fireStoreServices.getData(
      path: BackEndEndPoints.userCollection,
      recordId: userId,
    );
    return UserModel.fromJson(data);
  }

  Future<UserModel?> _checkIfUserExists(String userId) async {
    try {
      return await getUserData(userId: userId);
    } catch (e) {
      return null; // User doesn't exist
    }
  }

  Future<UserModel> _createSocialUser(User firebaseUser) async {
    final userModel = UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? '',
      imageUrl: firebaseUser.photoURL ??
          'https://img.freepik.com/premium-vector/character-avatar-isolated_729149-194801.jpg',
    );

    await fireStoreServices.addData(
      path: BackEndEndPoints.userCollection,
      recordId: firebaseUser.uid,
      data: userModel.toJson(),
    );

    return userModel;
  }
//------------------------------ Update Methods------------------------------
}
