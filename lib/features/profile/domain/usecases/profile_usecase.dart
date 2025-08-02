import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repos/profile_repo.dart';

abstract class ProfileUseCase {
  Future<Either<Failure, void>> updateEmail({required String email});

  Future<Either<Failure, void>> updateUserName({required String name});

  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, void>> updateUserProfileImage({
    required String imageUrl,
  });
  Future<Either<Failure, String>> uploadProfileImage(File imageFile);
  Future<Either<Failure, void>> signOut();
}

class ProfileUseCaseImpl extends ProfileUseCase {
  final ProfileRepo profileRepo;

  ProfileUseCaseImpl(this.profileRepo);

  @override
  Future<Either<Failure, void>> updateEmail({required String email}) async {
    return await profileRepo.updateEmail(email: email);
  }

  @override
  Future<Either<Failure, void>> updateUserName({required String name}) async {
    return await profileRepo.updateUserName(name: name);
  }

  @override
  Future<Either<Failure, void>> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await profileRepo.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  @override
  Future<Either<Failure, void>> updateUserProfileImage(
      {required String imageUrl}) async {
    return await profileRepo.updateUserProfileImage(imageUrl: imageUrl);
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    return await profileRepo.signOut();
  }

  @override
  Future<Either<Failure, String>> uploadProfileImage(File imageFile) async {
    return await profileRepo.uploadProfileImage(imageFile);
  }
}
