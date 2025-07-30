import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../auth/domain/repos/auth_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authRepo) : super(ProfileInitial());
  final AuthRepo authRepo;

  void updateUserName({
    required String userId,
    required String name,
  }) async {
    emit(ProfileLoading());
    var result = await authRepo.updateUserName(userId: userId, name: name);
    result.fold(
      (failure) {
        emit(ProfileFailure(failMessage: failure.message));
      },
      (ifRight) {
        emit(ProfileSuccess());
      },
    );
  }

  //--------------------------
  void updateEmail({
    required String userId,
    required String email,
  }) async {
    emit(ProfileLoading());
    var result = await authRepo.updateEmail(userId: userId, email: email);
    result.fold(
      (failure) {
        emit(ProfileFailure(failMessage: failure.message));
      },
      (ifRight) {
        emit(ProfileSuccess());
      },
    );
  }

//
  void signOut() async {
    emit(ProfileLogoutLoading());
    var result = await authRepo.logout();
    result.fold((fail) {
      emit(ProfileLogoutFailure(failMessage: fail.message));
    }, (success) {
      emit(ProfileLogoutSuccess());
    });
  }
}
