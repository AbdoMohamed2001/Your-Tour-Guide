import 'package:cached_network_image/cached_network_image.dart';
import 'package:your_tour_guide/core/utils/constants.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/core/utils/widgets/default-services-details-image/back_widget.dart';
import 'package:your_tour_guide/core/utils/widgets/rate_widget.dart';
import 'package:your_tour_guide/features/cinemas/domain/entities/movie_entity.dart';
import 'package:your_tour_guide/generated/assets.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/core/utils/widgets/head_text.dart';
import 'package:flutter/material.dart';

class MovieView extends StatelessWidget {
  const MovieView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: movie.imageUrl,
                  height: 370,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                BackWidget(),
              ],
            ),
            kSizedBox,
            //----------------
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name and rate
                  Text(
                    movie.name,
                    style: TextStyles.bold24,
                  ),
                  kSizedBox,
                  RateWidget(rate: movie.rate, starIconIncluded: true),
                  kSizedBox,
                  kDivider,
                  kSizedBox,
                  //--------------------------------------------------------------
                  //category
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            Assets.imagesMovie,
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(height: 10),
                          Text(
                            movie.category,
                            style:
                                TextStyle(color: Colors.orange, fontSize: 16),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            Assets.imagesDurationIcon3,
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(height: 10),
                          Text(
                            movie.length,
                            style:
                                TextStyle(color: Colors.orange, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  kSizedBox,
                  kDivider,
                  kSizedBox,
                  //Description
                  HeadText(text: S.of(context).Description),
                  kSizedBox,
                  Text(
                    movie.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  kSizedBox,
                  HeadText(text: S.of(context).cast),
                  kSizedBox,
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => Text(
                        movie.cast[index],
                        style: TextStyle(fontSize: 17),
                      ),
                      separatorBuilder: (_, index) => Text("  -  "),
                      itemCount: movie.cast.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
