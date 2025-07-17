import 'package:equatable/equatable.dart';

class SearchParamsEntity extends Equatable {
  final String query;
  final List<String>? specificCollections;
  final int? limit;
  final bool sortByRelevance;

  const SearchParamsEntity({
    required this.query,
    this.specificCollections,
    this.limit,
    this.sortByRelevance = true,
  });

  @override
  List<Object?> get props => [
        query,
        specificCollections,
        limit,
        sortByRelevance,
      ];
}
