class MovieEntity {
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

  MovieEntity({
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
}
