import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/repos/search_repo.dart';

class GetSearchSuggestionsParams {
  final String query;
  final int limit;

  const GetSearchSuggestionsParams({
    required this.query,
    this.limit = 10,
  });
}

class GetSearchSuggestionsUseCase
    implements UseCase<List<String>, GetSearchSuggestionsParams> {
  final SearchRepo searchRepo;

  GetSearchSuggestionsUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<String>>> call(
      GetSearchSuggestionsParams params) async {
    if (params.query.trim().isEmpty) {
      return const Right([]);
    }
    return await searchRepo.getSearchSuggestions(params.query,
        limit: params.limit);
  }
}
