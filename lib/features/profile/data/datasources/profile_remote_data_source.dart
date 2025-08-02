import 'dart:io';
import 'package:your_tour_guide/core/services/database_services.dart';
import 'package:your_tour_guide/core/services/firebase_auth_services.dart';
import 'package:your_tour_guide/core/services/storage_services.dart';
import 'package:your_tour_guide/core/utils/functions/get_user_data.dart';

import '../../../../core/utils/backend_endpoints.dart';

abstract class ProfileRemoteDataSource {
  Future<void> updateUserName({required String name});

  Future<void> updateEmail({required String email});

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<String> uploadProfileImage(File file);

  Future<void> updateUserProfileImage({required String imageUrl});

  Future<void> signOut();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;
  final StorageServices firebaseStorageServices;

  ProfileRemoteDataSourceImpl(
    this.firebaseAuthService,
    this.databaseServices,
    this.firebaseStorageServices,
  );

  Future<void> updateUserName({required String name}) async {
    //1 Update Firebase Authentication

    await firebaseAuthService.updateUserName(displayName: name);
    //2 Update Firestore "users" Collection
    await databaseServices.updateData(
      path: BackEndEndPoints.userCollection,
      recordId: getUserData().id,
      fieldName: 'name',
      fieldData: name,
    );
  }

  @override
  Future<void> updateEmail({
    required String email,
  }) async {
    //1 Update Firebase Authentication
    await firebaseAuthService.updateUserEmail(email: email);
    //2 Update Firestore "users" Collection
    await databaseServices.updateData(
      path: BackEndEndPoints.userCollection,
      recordId: getUserData().id,
      fieldName: 'email',
      fieldData: email,
    );
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthService.signOut();
  }

  @override
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await firebaseAuthService.reAuth(password: currentPassword);
    await firebaseAuthService.updateUserPassword(newPassword: newPassword);
  }

  @override
  Future<String> uploadProfileImage(File file) async {
    String imageUrl = await firebaseStorageServices.uploadFile(
      file,
      BackEndEndPoints.profilePictureRef,
      getUserData().id,
    );
    return imageUrl;
  }

  @override
  Future<void> updateUserProfileImage({required String imageUrl}) async {
    final currentUser = await firebaseAuthService.getCurrentUser();
    if (currentUser == null) {
      return;
    }
    // Update Firebase Auth profile
    await firebaseAuthService.updateProfilePicture(imageUrl: imageUrl);
    // Update Firebase Firestore collection
    databaseServices.updateData(
      path: BackEndEndPoints.userCollection,
      recordId: currentUser.uid,
      fieldName: 'imageUrl',
      fieldData: imageUrl,
    );
  }
}
