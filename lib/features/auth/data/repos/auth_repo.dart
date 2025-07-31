import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/auth/data/models/user_create_req_model.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> register(
      UserCreateReqModel userCreateModel);

  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, void>> logout();

  Future<Either<Failure, UserEntity>> loginWithGoogle();

  Future<Either<Failure, UserEntity>> loginWithFacebook();

  Either<Failure, bool> isLogged();

  //Update
}
