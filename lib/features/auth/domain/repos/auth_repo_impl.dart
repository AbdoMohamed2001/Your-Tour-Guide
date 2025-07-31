import 'dart:developer' show log;
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_tour_guide/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../data/datasources/local/auth_local_datasource.dart';
import '../entities/user_entity.dart';
import '../../data/repos/auth_repo.dart';
import '../../data/models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepoImpl(this.authRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      var user = await authRemoteDataSource.login(email, password);
      await authLocalDataSource.saveUser(user);
      return right(user.toEntity());
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('Error in AuthRepo Impl LoginUser : ${e.toString()}');
      return left(
          ServerFailure(message: 'هناك خطأ ما برجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(userCreateModel) async {
    try {
      UserModel userModel =
          await authRemoteDataSource.register(userCreateModel);
      await authLocalDataSource.saveUser(userModel);

      return right(userModel.toEntity());
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: 'There is an error'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authRemoteDataSource.signOut();
      return right(null);
    } catch (e) {
      log('error while trying to logout ${e.toString()}');
      return left(Failure(message: 'error while trying to logout'));
    }
  }

  @override
  Either<Failure, bool> isLogged() {
    return authRemoteDataSource.isLogged();
  }

  //---------------------------- Social login--------------------------------
  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      UserModel user = await authRemoteDataSource.loginWithGoogle();
      await authLocalDataSource.saveUser(user);
      return right(user.toEntity());
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } on FirebaseAuthException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      log('Error in AuthRepo Impl GoogleSignIn : ${e.toString()}');
      return left(
          ServerFailure(message: 'هناك خطأ ما برجاء المحاولة في وقت لاحق'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      UserModel user = await authRemoteDataSource.loginWithFacebook();
      await authLocalDataSource.saveUser(user);
      return right(user.toEntity());
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('Error in AuthRepo Impl FacebookSignIn : ${e.toString()}');
      return left(
          ServerFailure(message: 'هناك خطأ ما برجاء المحاولة في وقت لاحق'));
    }
  }

//----------------------------------------------------------------------------
}
