import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cinemas/domain/entities/movie_entity.dart';
import 'package:your_tour_guide/features/cinemas/presentation/views/movie_view.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return MovieView(movie: movie);
        }));
      },
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: movie.imageUrl,
                  width: double.infinity,
                  height: 185,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              movie.name.replaceAll('_b', '\n'),
              textAlign: TextAlign.center,

              // 'Oppenheimer'
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 4),
                  Text('${movie.rate}/10'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
