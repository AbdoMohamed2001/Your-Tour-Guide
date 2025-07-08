import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/functions/is_arabic.dart';
import 'package:your_tour_guide/core/utils/text_styles.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_tour_guide/features/favourite/presentation/cubit/favourtie_cubit.dart';

import '../../../../features/favourite/data/models/favourite_model.dart';
import '../../../../features/favourite/data/repos/favourite_repo.dart';
import '../../../cubits/home/home_cubit.dart';
import '../../../services/get_it_services_locator.dart';
import '../default_cached_network_image.dart';

class CustomPlaceImage extends StatelessWidget {
  const CustomPlaceImage({
    super.key,
    required this.cubitDataKeyCurrentContext,
    this.fontSize = 22,
    this.entity,
  });

  final cubitDataKeyCurrentContext;
  final double? fontSize;
  final dynamic entity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavouriteCubit(getIt<FavouriteRepo>())..loadLocalFavourites(),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Stack(
          children: [
            DefaultCachedNetworkImage(
                imageUrl: entity.imageUrl, imageHeight: 370),
            //Name
            Positioned(
              top: 285,
              right: isArabic() ? 15 : null,
              left: isArabic() ? null : 15,
              child: BorderedText(
                strokeColor: Colors.black,
                strokeWidth: 2,
                child: Text(
                  isArabic()
                      ? entity.nameArabic.replaceAll('_b', '\n')
                      : entity.name.replaceAll('_b', '\n'),
                  maxLines: 2,
                  style: TextStyles.bold22,
                ),
              ),
            ), //Done
            //City
            Positioned(
              top: 320,
              right: isArabic() ? 15 : null,
              left: isArabic() ? null : 15,
              child: BorderedText(
                strokeColor: Colors.black,
                strokeWidth: 2,
                child: Text(
                  isArabic() ? entity.cityNameArabic : entity.cityName,
                  style: TextStyles.regular22,
                ),
              ),
            ), //Done
            //End Image
            entity.images.isEmpty
                ? Container()
                : Positioned(
                    top: 310,
                    right: isArabic() ? null : 10,
                    left: isArabic() ? 10 : null,
                    child: GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(cubitDataKeyCurrentContext!);
                      },
                      child: Container(
                        width: 55,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.white,
                            width: 0.8,
                          ),
                        ),
                        child: ClipRRect(
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(entity.images[0]),
                              ),
                              Center(
                                child: BorderedText(
                                  strokeColor: Colors.black,
                                  strokeWidth: 1.5,
                                  strokeCap: StrokeCap.butt,
                                  strokeJoin: StrokeJoin.bevel,
                                  child: Text(
                                    entity.images.isEmpty
                                        ? ''
                                        : '+${entity.images.length}',
                                    style: TextStyles.bold16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            //Favourite
            Positioned(
              top: 30,
              right: isArabic() ? null : 10,
              left: isArabic() ? 10 : null,
              child: BlocConsumer<FavouriteCubit, FavouriteState>(
                listener: (context, state) {
                  if (state is FavouriteToggleFailure) {
                    // Handle error if needed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  bool isFav = false;
                  bool isLoading = false;
                  if (state is FavouriteToggleSuccess) {
                    isFav = state.favourites.contains(entity.docId);
                  } else if (state is FavouriteToggleLoading) {
                    isLoading = true;
                    // You could maintain previous favorite state during loading
                  }
                  return IconButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            final model = FavouriteModel(
                              docId: entity.docId,
                              name: entity.name,
                              nameArabic: entity.nameArabic,
                              image: entity.imageUrl,
                              cityName: entity.cityName,
                              cityNameArabic: entity.cityNameArabic,
                              collectionName: 'places',
                            );
                            context.read<FavouriteCubit>().toggle(model);
                          },
                    icon: Icon(
                      Icons.favorite,
                      color: isFav ? Colors.red : Colors.white,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
            //Back
            Positioned(
              top: 30,
              right: isArabic() ? 10 : null, //null 0
              left: isArabic() ? null : 10, //10 null

              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  isArabic()
                      ? FontAwesomeIcons.chevronRight
                      : FontAwesomeIcons.chevronLeft,
                  color: HomeCubit.get(context).isDark!
                      ? Colors.white
                      : Colors.black,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
