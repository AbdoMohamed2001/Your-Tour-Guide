import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/auth/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/repos/auth_repo.dart';

class LoginWithFacebookUseCase extends UseCase<UserEntity, NoParams> {
  final AuthRepo authRepo;

  LoginWithFacebookUseCase(this.authRepo);

  @override
  Future<Either<Failure, UserEntity>> call({NoParams? params}) async {
    return await authRepo.loginWithFacebook();
  }
}
