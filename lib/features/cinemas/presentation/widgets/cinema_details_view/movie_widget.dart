import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cinemas/presentation/views/movie_view.dart';

import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../domain/entities/cinema_entity.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.cinemaEntity,
    required this.index,
  });

  final CinemaEntity cinemaEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return MovieView(
            cinemaEntity: cinemaEntity,
            index: index,
          );
        }));
      },
      child: Container(
        width: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.network(
                  cinemaEntity.films[index]['imageUrl'],
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  isArabic()
                      ? cinemaEntity.filmsArabic[index]['name']
                          .replaceAll('_b', '\n')
                      : cinemaEntity.films[index]['name']
                          .replaceAll('_b', '\n'),
                  textAlign: TextAlign.center,

                  // 'Oppenheimer'
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isArabic()
                            ? cinemaEntity.filmsArabic[index]['price']
                            : cinemaEntity.films[index]['price'],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                          ),
                          Text('${cinemaEntity.films[index]['rate']}/10'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
