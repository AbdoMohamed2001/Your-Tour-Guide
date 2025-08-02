import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:your_tour_guide/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:your_tour_guide/features/profile/domain/repos/profile_repo.dart';

import '../../../../core/errors/failure.dart';

import '../../../../core/utils/constants.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepoImpl(this.profileRemoteDataSource, this.profileLocalDataSource);

  @override
  Future<Either<Failure, void>> updateUserName({required String name}) async {
    //1 Update Firebase
    try {
      await profileRemoteDataSource.updateUserName(
        name: name,
      );
      // 2. Update Cached User Data
      await profileLocalDataSource.updateCachedData(
        key: kCachedUserData,
        fieldName: 'name',
        fieldValue: name,
      );
    } catch (e) {
      log('error in update user name in profile repo $e');
      return left(
          ServerFailure(message: 'Error while trying to update user name'));
    }
    return right(null);
  }

  @override
  Future<Either<Failure, void>> updateEmail({
    required String email,
  }) async {
    //1 Update Firebase
    try {
      await profileRemoteDataSource.updateEmail(email: email);
      // 2. Update Cached User Data
      await profileLocalDataSource.updateCachedData(
        key: kCachedUserData,
        fieldName: 'email',
        fieldValue: email,
      );
    } catch (e) {
      log('error in update Email in profile repo $e');
      return left(ServerFailure(message: 'Error while trying to update email'));
    }
    return right(null);
  }

  @override
  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await profileRemoteDataSource.updatePassword(
          currentPassword: currentPassword, newPassword: newPassword);
      return right(null);
    } catch (e) {
      log('error in update password in profile repo $e');
      return left(
          ServerFailure(message: 'Error while trying to update password'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await profileRemoteDataSource.signOut();
      return right(null);
    } catch (e) {
      log('error in logout in profile repo $e');
      return left(ServerFailure(message: 'Error while trying to logging out'));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserProfileImage(
      {required String imageUrl}) async {
    try {
      // 1 Update Remote Data
      await profileRemoteDataSource.updateUserProfileImage(imageUrl: imageUrl);
      // 2 Update Cached User Data
      await profileLocalDataSource.updateCachedData(
        key: kCachedUserData,
        fieldName: 'imageUrl',
        fieldValue: imageUrl,
      );
      return right(null);
    } catch (e) {
      log('error in update profile image in profile repo $e');
      return left(ServerFailure(message: 'Error while trying to update image'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfileImage(File imageFile) async {
    try {
      // 1 Update Firebase
      var imageUrl =
          await profileRemoteDataSource.uploadProfileImage(imageFile);
      return right(imageUrl);
    } catch (e) {
      log('error in upload profile image in profile repo $e');
      return left(ServerFailure(message: 'Error while trying to upload image'));
    }
  }
}
