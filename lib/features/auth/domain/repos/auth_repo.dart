import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> register(
    String email,
    String password,
    String name,
    String imageUrl,
  );

  Future<Either<Failure, UserEntity>> login(String email, String password);

  Future<Either<Failure, UserEntity>> loginWithGoogle();

  Future<Either<Failure, UserEntity>> loginWithFacebook();

  Future addUserData({required UserEntity userEntity});

  Future cacheUserData({required UserEntity userEntity});

  Future updateCachedData({
    required String key,
    required String fieldName,
    required String fieldValue,
  });

  Future<Either<Failure, void>> updateUserName(
      {required String userId, required String name});

  Future<Either<Failure, void>> updateEmail(
      {required String userId, required String email});

  Future<UserEntity> getUserData({required String docId});
}
