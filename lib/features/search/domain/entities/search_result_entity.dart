import 'package:equatable/equatable.dart';

class SearchResultEntity extends Equatable {
  final String id;
  final String name;
  final String nameArabic;
  final String collection;

  const SearchResultEntity({
    required this.id,
    required this.name,
    required this.nameArabic,
    required this.collection,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        nameArabic,
        collection,
      ];
}
