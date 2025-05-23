import 'dart:convert';
import 'dart:developer' show log;

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/services/shared_prefs_services.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseServices,
  });

  @override
  Future<Either<Failure, UserEntity>> register(
    String email,
    String password,
    String name,
    String imageUrl,
  ) async {
    User? user;
    try {
      //register user in firebase
      user = await firebaseAuthService.registerUser(
          email: email, password: password);
      UserEntity userEntity = UserModel.fromFireBaseUser(user);
      //add user data to users collection
      await addUserData(
        userEntity: UserEntity(
          id: user.uid,
          name: name,
          email: email,
          imageUrl: imageUrl,
        ),
        userId: user.uid,
      );
      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUserMethod(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: 'There is an error'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.loginUser(email: email, password: password);
      UserEntity userEntity = await getUserData(docId: user.uid);
      await cacheUserData(userEntity: userEntity);
      log(userEntity.name);
      log(userEntity.email);
      return right(
        UserModel.fromFireBaseUser(user),
      );
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('Error in AuthRepo Impl LoginUser : ${e.toString()}');
      return left(
          ServerFailure(message: 'هناك خطأ ما برجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      UserEntity userEntity = UserModel.fromFireBaseUser(user);
      await addUserData(userEntity: userEntity, userId: user.uid);
      await getUserData(docId: user.uid);
      await cacheUserData(userEntity: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      deleteUserMethod(user);
      log('Error in AuthRepo Impl GoogleSignIn : ${e.toString()}');
      return left(
          ServerFailure(message: 'هناك خطأ ما برجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      UserEntity userEntity = UserModel.fromFireBaseUser(user);
      await addUserData(userEntity: userEntity, userId: user.uid);
      await getUserData(docId: user.uid);
      await cacheUserData(userEntity: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      deleteUserMethod(user);
      log('Error in AuthRepo Impl FacebookSignIn : ${e.toString()}');
      return left(
          ServerFailure(message: 'هناك خطأ ما برجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity, String? userId}) async {
    await databaseServices.addUser(
      path: 'users',
      data: UserModel.fromEntity(userEntity).toMap(),
      docId: userId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String docId}) async {
    var data = await databaseServices.getData(path: 'users', recordId: docId);
    return UserModel.fromFireStore(data);
  }

  @override
  Future cacheUserData({required UserEntity userEntity}) async {
    var userModelEncoded = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await Prefs.setString(kUserData, userModelEncoded);
  }

  Future<void> deleteUserMethod(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

//------------------------------------ Update ----------------------------------------
  @override
  Future<Either<Failure, void>> updateUserName(
      {required String userId, required String name}) async {
    //1 Update Firebase Authentication
    try {
      await firebaseAuthService.updateUserName(
          userId: userId, displayName: name);
      //2 Update Firestore "users" Collection
      await databaseServices.updateData(
        path: 'users',
        recordId: userId,
        fieldName: 'name',
        fieldData: name,
      );
      // 3. Update Cached User Data
      await updateCachedData(
          key: kUserData, fieldName: 'name', fieldValue: name);
    } catch (e) {
      log('error in update user name auth repo $e');
      return left(ServerFailure(message: 'error while trying to update data'));
    }
    return right(null);
  }

  //-----------
  @override
  Future<Either<Failure, void>> updateEmail(
      {required String userId, required String email}) async {
    //1 Update Firebase Authentication
    try {
      await firebaseAuthService.updateUserEmail(userId: userId, email: email);
      //2 Update Firestore "users" Collection
      await databaseServices.updateData(
        path: 'users',
        recordId: userId,
        fieldName: 'email',
        fieldData: email,
      );
      // 3. Update Cached User Data
      // await updateCachedData(
      //     key: kUserData, fieldName: 'email', fieldValue: email);
    } catch (e) {
      log('error in update user name auth repo $e');
      return left(ServerFailure(message: 'error while trying to update data'));
    }
    return right(null);
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  //-------------------------------------------
  @override
  Future updateCachedData({
    required String key,
    required String fieldName,
    required String fieldValue,
  }) async {
    try {
      String? cachedData = Prefs.getString(key);
      if (cachedData != null) {
        Map<String, dynamic> dataMap =
            jsonDecode(cachedData) as Map<String, dynamic>;
        Map<String, dynamic> updatedCachedData = {...dataMap};
        updatedCachedData[fieldName] = fieldValue;
        var updatedDataEncoded = jsonEncode(updatedCachedData);
        await Prefs.setString(key, updatedDataEncoded);
      }
    } catch (e) {
      log("Error updating display name in cache: $e");
    }
  }
}
