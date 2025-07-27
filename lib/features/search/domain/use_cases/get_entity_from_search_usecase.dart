import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/features/search/data/repos/search_repo.dart';
import 'package:your_tour_guide/features/search/domain/entities/search_result_entity.dart';

class GetEntityFromSearchUseCase {
  final SearchRepo searchRepo;

  GetEntityFromSearchUseCase(this.searchRepo);

  Future<Either<Failure, dynamic>> call(SearchResultEntity search) async {
    return await searchRepo.getEntityFromSearch(search);
  }
}
