class FavouriteModel {
  final String docId;
  final String name;
  final String nameArabic;
  final String cityName;
  final String cityNameArabic;
  final String image;
  final String collectionName;

  FavouriteModel({
    required this.docId,
    required this.name,
    required this.nameArabic,
    required this.cityName,
    required this.cityNameArabic,
    required this.image,
    required this.collectionName,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      docId: json['docId'],
      name: json['name'],
      nameArabic: json['name_arabic'],
      cityName: json['city_name'],
      cityNameArabic: json['city_name_arabic'],
      image: json['image'],
      collectionName: json['collection_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'name': name,
      'name_arabic': nameArabic,
      'city_name': cityName,
      'city_name_arabic': cityNameArabic,
      'image': image,
      'collection_name': collectionName,
    };
  }
}
