import '../../domain/entities/search_result_entity.dart';

class SearchResultModel {
  final String id;
  final String name;
  final String nameArabic;
  final String collection;

  const SearchResultModel({
    required this.id,
    required this.name,
    required this.nameArabic,
    required this.collection,
  });

  factory SearchResultModel.fromJson(
      Map<String, dynamic> json, String collectionName) {
    return SearchResultModel(
      id: json['docId'],
      name: json['name'],
      nameArabic: json['nameArabic'],
      collection: collectionName,
    );
  }

  SearchResultEntity toEntity() {
    return SearchResultEntity(
      id: id,
      name: name,
      nameArabic: nameArabic,
      collection: collection,
    );
  }
}
