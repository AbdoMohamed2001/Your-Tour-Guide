import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/repos/auth_repo.dart';

class IsLoggedUseCase extends UseCase<bool, dynamic> {
  final AuthRepo authRepo;

  IsLoggedUseCase(this.authRepo);
  @override
  Future<Either<Failure, bool>> call({params}) async {
    return await authRepo.isLogged();
  }
}
