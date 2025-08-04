import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/auth/data/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/user_create_req_model.dart';
import '../../data/models/user_login_req_model.dart';
import '../entities/user_entity.dart';

abstract class AuthUseCase {
  Future<Either<Failure, UserEntity>> loginUseCase({UserLoginReqModel? params});
  Future<Either<Failure, bool>> isLoggedUseCase({params});
  Future<Either<Failure, UserEntity>> loginWithFacebookUseCase(
      {NoParams? params});
  Future<Either<Failure, UserEntity>> loginWithGoogleUseCase(
      {NoParams? params});
  Future<Either<Failure, UserEntity>> registerUseCase(
      {UserCreateReqModel? params});
}

class AuthUseCaseImpl implements AuthUseCase {
  final AuthRepo authRepo;

  AuthUseCaseImpl(this.authRepo);
  @override
  Future<Either<Failure, UserEntity>> loginUseCase(
      {UserLoginReqModel? params}) async {
    return await authRepo.login(params!.email, params.password!);
  }

  @override
  Future<Either<Failure, UserEntity>> registerUseCase(
      {UserCreateReqModel? params}) async {
    return await authRepo.register(params!);
  }

  @override
  Future<Either<Failure, bool>> isLoggedUseCase({params}) async {
    return await authRepo.isLogged();
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebookUseCase(
      {NoParams? params}) async {
    return await authRepo.loginWithFacebook();
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogleUseCase(
      {NoParams? params}) async {
    return await authRepo.loginWithGoogle();
  }
}
