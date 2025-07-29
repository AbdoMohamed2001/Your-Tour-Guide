import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/features/tours/domain/entities/tour_entity.dart';
import 'package:your_tour_guide/features/tours/domain/repos/tour_repo.dart';

class GetToursUseCase {
  final TourRepo tourRepo;

  GetToursUseCase(this.tourRepo);

  Future<Either<Failure, List<TourEntity>>> call({String? tourType}) async {
    return await tourRepo.getTours(tourType: tourType);
  }
}
