import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/favourite/presentation/cubit/favourtie_cubit.dart';
import '../../../../features/favourite/data/repos/favourite_repo.dart';
import '../../../services/get_it_services_locator.dart';
import '../default_cached_network_image.dart';
import 'back_widget.dart';
import 'city_widget.dart';
import 'end_image_widget.dart';
import 'fav_widget.dart';
import 'name_widget.dart';

class DefaultServiceDetailsImage extends StatelessWidget {
  const DefaultServiceDetailsImage({
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
              imageUrl: entity.imageUrl,
              imageHeight: 370,
            ),
            //Name
            NameWidget(entity: entity), //Done
            //City
            CityWidget(entity: entity), //Done
            //End Image
            entity.images.isEmpty
                ? Container()
                : EndImageWidget(
                    cubitDataKeyCurrentContext: cubitDataKeyCurrentContext,
                    entity: entity),
            //Favourite
            FavouriteWidget(entity: entity),
            //Back
            BackWidget(),
          ],
        ),
      ),
    );
  }
}
