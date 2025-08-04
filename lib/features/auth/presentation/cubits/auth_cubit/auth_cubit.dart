import 'package:your_tour_guide/core/utils/functions/pick_image.dart';
import 'package:your_tour_guide/features/auth/data/models/user_create_req_model.dart';
import 'package:your_tour_guide/features/auth/data/models/user_login_req_model.dart';
import 'package:your_tour_guide/features/auth/domain/usecases/auth_usecase.dart';

import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authUseCase) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context); // عشان اخد object
  final AuthUseCase authUseCase;

  Uint8List? image;
  late ByteData imageData;
//--------------------------------------------------------
  Future<void> loginUser({
    required UserLoginReqModel userLoginInfo,
  }) async {
    emit(AuthLoading());
    var result = await authUseCase.loginUseCase(params: userLoginInfo);
    result.fold(
      (fail) {
        emit(AuthFailure(errMessage: fail.message));
      },
      (success) {
        emit(AuthSuccess());
      },
    );
  }
//--------------------------------------------------------

  Future<void> signUpUser({
    required UserCreateReqModel user,
  }) async {
    emit(AuthLoading());
    var result = await authUseCase.registerUseCase(params: user);
    result.fold(
      (fail) {
        emit(AuthFailure(errMessage: fail.message));
      },
      (success) {
        emit(AuthSuccess());
      },
    );
  }

//--------------------------------------------------------
  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    var result = await authUseCase.loginWithGoogleUseCase.call();
    result.fold(
      (fail) {
        emit(AuthFailure(errMessage: fail.toString()));
      },
      (success) {
        emit(AuthSuccess());
      },
    );
  }

//--------------------------------------------------------
  Future<void> loginWithFacebook() async {
    emit(AuthLoading());
    var result = await authUseCase.loginWithFacebookUseCase.call();
    result.fold(
      (fail) {
        emit(AuthFailure(errMessage: fail.toString()));
      },
      (success) {
        emit(AuthSuccess());
      },
    );
  }

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
