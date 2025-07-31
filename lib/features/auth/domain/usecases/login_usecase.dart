import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/auth/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/user_login_req_model.dart';
import '../../data/repos/auth_repo.dart';

class LoginUseCase extends UseCase<void, UserLoginReqModel> {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  @override
  Future<Either<Failure, UserEntity>> call({UserLoginReqModel? params}) async {
    return await authRepo.login(params!.email, params.password!);
  }
}
