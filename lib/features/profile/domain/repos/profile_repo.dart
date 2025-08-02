import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> updateUserName({required String name});
  Future<Either<Failure, void>> updateEmail({required String email});
  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Either<Failure, String>> uploadProfileImage(File imageFile);
  Future<Either<Failure, void>> updateUserProfileImage(
      {required String imageUrl});
  Future<Either<Failure, void>> signOut();
}
