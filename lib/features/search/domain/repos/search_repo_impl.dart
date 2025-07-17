import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/exceptions.dart';
import 'package:your_tour_guide/features/search/data/repos/search_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../data/data_sources/search_remote_data_source.dart';
import '../../domain/entities/search_result_entity.dart';
import '../../domain/entities/search_params_entity.dart';

class SearchRepositoryImpl implements SearchRepo {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<SearchResultEntity>>> searchAcrossCollections(
    SearchParamsEntity params,
  ) async {
    try {
      final results = await remoteDataSource.searchAcrossCollections(params);
      List<SearchResultEntity> searchResults =
          results.map((model) => model.toEntity()).toList();
      return Right(searchResults);
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSearchSuggestions(
    String query, {
    int limit = 10,
  }) async {
    try {
      final suggestions =
          await remoteDataSource.getSearchSuggestions(query, limit: limit);
      return Right(suggestions);
    } on CustomExceptions catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Unexpected error occurred: $e'));
    }
  }
}
