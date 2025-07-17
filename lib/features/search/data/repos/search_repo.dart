// lib/domain/repositories/search_repository.dart
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/search_params_entity.dart';
import '../../domain/entities/search_result_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchResultEntity>>> searchAcrossCollections(
    SearchParamsEntity params,
  );

  Future<Either<Failure, List<String>>> getSearchSuggestions(
    String query, {
    int limit = 10,
  });
}
