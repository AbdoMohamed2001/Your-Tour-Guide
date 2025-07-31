import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/auth/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/user_create_req_model.dart';
import '../../data/repos/auth_repo.dart';

class RegisterUseCase extends UseCase<void, UserCreateReqModel> {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);
  @override
  Future<Either<Failure, UserEntity>> call({UserCreateReqModel? params}) async {
    return await authRepo.register(params!);
  }
}
