import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/search/data/repos/search_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/search_result_entity.dart';
import '../entities/search_params_entity.dart';

class SearchAcrossCollectionsUseCase
    implements UseCase<List<SearchResultEntity>, SearchParamsEntity> {
  final SearchRepo searchRepo;

  SearchAcrossCollectionsUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<SearchResultEntity>>> call(
      {SearchParamsEntity? params}) async {
    if (params!.query.trim().isEmpty) {
      return const Right([]);
    }
    return await searchRepo.searchAcrossCollections(params);
  }
}
