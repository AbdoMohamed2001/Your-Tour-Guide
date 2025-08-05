import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/favourite/presentation/cubit/favourtie_cubit.dart';
import '../../../../features/favourite/data/repos/favourite_repo.dart';
import '../../../services/get_it_services_locator.dart';
import '../default_cached_network_image.dart';
import '../full_screen_image_view.dart';
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
    this.isNotEvent = true,
  });

  final cubitDataKeyCurrentContext;
  final double? fontSize;
  final dynamic entity;
  final bool isNotEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavouriteCubit(getIt<FavouriteRepo>())..loadLocalFavourites(),
      child: ClipRRect(
        child: Stack(
          children: [
            //Image
            DefaultServicesDetailsImages(entity: entity),
            // DefaultCachedNetworkImage(
            //   imageUrl: entity.imageUrl,
            //   imageHeight: 370,
            // ),
            //Name
            NameWidget(entity: entity), //Done
            //City
            isNotEvent ? CityWidget(entity: entity) : const SizedBox(), //Done
            //End Image
            isNotEvent ? EndImageWidget(images: entity.images) : Container(),

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

class DefaultServicesDetailsImages extends StatefulWidget {
  const DefaultServicesDetailsImages({
    super.key,
    required this.entity,
  });

  final dynamic entity;

  @override
  State<DefaultServicesDetailsImages> createState() =>
      _DefaultServicesDetailsImagesState();
}

class _DefaultServicesDetailsImagesState
    extends State<DefaultServicesDetailsImages> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      child: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: widget.entity.images.length,
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImageView(
                  index: currentIndex,
                  photos: widget.entity.images,
                ),
              ),
            );
          },
          child: DefaultCachedNetworkImage(
            imageUrl: widget.entity.images[index],
          ),
        ),
      ),
    );
  }
}
