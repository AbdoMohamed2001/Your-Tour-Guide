import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:your_tour_guide/features/profile/domain/usecases/profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileUseCase) : super(ProfileInitial());
  final ProfileUseCase profileUseCase;

  void updateUserName({
    required String name,
  }) async {
    emit(ProfileLoading());
    var result = await profileUseCase.updateUserName(name: name);
    result.fold(
      (failure) {
        emit(ProfileFailure(failMessage: failure.message));
      },
      (ifRight) {
        emit(ProfileSuccess());
      },
    );
  }

  // --------------------------
  void updateEmail({
    required String email,
  }) async {
    emit(ProfileLoading());
    var result = await profileUseCase.updateEmail(email: email);
    result.fold(
      (failure) {
        emit(ProfileFailure(failMessage: failure.message));
      },
      (ifRight) {
        emit(ProfileSuccess());
      },
    );
  }

  // --------------------------
  void updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ProfileLoading());
    var result = await profileUseCase.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold(
      (failure) {
        emit(ProfileFailure(failMessage: failure.message));
      },
      (ifRight) {
        emit(ProfileSuccess());
      },
    );
  }

  // --------------------------
  void uploadAndUpdateProfileImage(File imageFile) async {
    emit(ProfileLoading());
    final imageUrl = await profileUseCase.uploadProfileImage(imageFile);
    imageUrl.fold(
      (fail) {
        emit(ProfileFailure(failMessage: fail.message));
      },
      (image) async {
        final updateResult =
            await profileUseCase.updateUserProfileImage(imageUrl: image);
        updateResult.fold(
          (failure) => emit(ProfileFailure(failMessage: failure.message)),
          (_) => emit(
              ProfileImageUploadSuccess('Profile image updated successfully')),
        );
      },
    );
  }

  void signOut() async {
    emit(ProfileLogoutLoading());
    var result = await profileUseCase.signOut();
    result.fold((fail) {
      emit(ProfileLogoutFailure(failMessage: fail.message));
    }, (success) {
      emit(ProfileLogoutSuccess());
    });
  }
}
