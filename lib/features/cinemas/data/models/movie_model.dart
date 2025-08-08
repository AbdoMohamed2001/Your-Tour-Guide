import 'package:your_tour_guide/features/cinemas/domain/entities/movie_entity.dart';

class MovieModel {
  final List<dynamic> cast;
  final String country;
  final String category;
  final String description;
  final String imageUrl;
  final String language;
  final String length;
  final String name;
  final String price;
  final String trailerUrl;
  final num rate;

  MovieModel({
    required this.cast,
    required this.country,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.language,
    required this.length,
    required this.name,
    required this.price,
    required this.trailerUrl,
    required this.rate,
  });
  factory MovieModel.fromJson(doc) {
    return MovieModel(
      cast: doc['cast'],
      country: doc['country'],
      category: doc['category'],
      description: doc['description'],
      imageUrl: doc['imageUrl'],
      language: doc['language'],
      length: doc['length'],
      name: doc['name'],
      price: doc['price'],
      trailerUrl: doc['trailerUrl'],
      rate: doc['rate'],
    );
  }

  MovieEntity toEntity() {
    return MovieEntity(
      cast: cast,
      country: country,
      category: category,
      description: description,
      imageUrl: imageUrl,
      language: language,
      length: length,
      name: name,
      price: price,
      trailerUrl: trailerUrl,
      rate: rate,
    );
  }
}
