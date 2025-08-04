import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/usecases/usecase.dart';
import 'package:your_tour_guide/features/cafes/data/repos/cafe_repo.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';

class GetCafesUseCase extends UseCase<List<CafeEntity>, String?> {
  final CafeRepo cafeRepo;

  GetCafesUseCase(this.cafeRepo);

  @override
  Future<Either<Failure, List<CafeEntity>>> call({String? params}) async {
    return await cafeRepo.getCafes(cityName: params);
  }
}
