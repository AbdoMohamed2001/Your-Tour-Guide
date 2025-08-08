import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/malls/domain/entities/mall_entity.dart';
import 'package:your_tour_guide/features/malls/presentation/cubit/mall_cubit.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/functions/is_arabic.dart';
import '../../../../../core/utils/widgets/default_read_more.dart';
import '../../../../../core/utils/widgets/head_text.dart';
import '../../../../../core/utils/widgets/location_widget.dart';
import '../../../../../core/utils/widgets/opening_hours_item.dart';
import '../../../../../core/utils/widgets/default-services-details-image/default_services_details_image.dart';
import '../../../../../core/utils/widgets/place/gallery_widget.dart';
import '../../../../../generated/l10n.dart';

class MallDetailsViewBody extends StatelessWidget {
  const MallDetailsViewBody({
    super.key,
    required this.mallEntity,
  });

  final MallEntity mallEntity;

  @override
  Widget build(BuildContext context) {
    final listOfStores = [
      'https://static.vecteezy.com/system/resources/previews/024/131/445/original/zara-brand-logo-white-symbol-clothes-design-icon-abstract-illustration-with-black-background-free-vector.jpg',
      'https://thumbs.dreamstime.com/b/hm-h-m-logo-editorial-illustrative-white-background-icon-vector-logos-icons-set-social-media-flat-banner-vectors-svg-eps-jpg-210442760.jpg',
      'https://cdn6.aptoide.com/imgs/4/d/6/4d678f324e23af8b03774960329bc357_fgraphic.png',
      'https://cdn2.arabiccoupon.com/sites/default/files/styles/icon_image/public/store_icon/american-eagle-logo-en-arabiccoupon-american-eagle-coupons-and-promo-codes-400x400.jpg',
    ];
    final listOfRestaurants = [
      'https://iconape.com/wp-content/png_logo_vector/la-brioche-doree.png',
      'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'https://assets.stickpng.com/images/5a1d30914ac6b00ff574e2a4.png',
      'https://i.pinimg.com/736x/ca/38/ca/ca38cabfc7f07d97a422859b91df07cd.jpg',
    ];
    return BlocBuilder<MallCubit, MallState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              //image
              DefaultServiceDetailsImage(entity: mallEntity),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Location and google map
                    LocationWidget(
                      address: isArabic()
                          ? mallEntity.addressArabic
                          : mallEntity.address,
                      mapUrl: mallEntity.mapUrl,
                      rate: mallEntity.rate,
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Opening hours
                    OpeningHoursWidget(
                      openFrom: isArabic()
                          ? mallEntity.openingHoursArabic['from']
                          : mallEntity.openingHours['from'],
                      openTo: isArabic()
                          ? mallEntity.openingHoursArabic['to']
                          : mallEntity.openingHours['to'],
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Description and rate
                    HeadText(text: S.of(context).Description),
                    kSizedBox,
                    ReadMoreWidget(
                      text: isArabic()
                          ? mallEntity.descriptionArabic
                          : mallEntity.description,
                    ),
                    kSizedBox,
                    kDivider,
                    kSizedBox,
                    //-------------------------------------------------------------------
                    //Shopping Stores
                    HeadText(text: S.of(context).mostFamousShopping),
                    kSizedBox,
                    Container(
                      color: Theme.of(context).cardColor,
                      height: 170,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => CachedNetworkImage(
                          imageUrl: listOfStores[index],
                          height: 170,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        separatorBuilder: (_, index) => SizedBox(width: 15),
                        itemCount: listOfStores.length,
                      ),
                    ),
                    kSizedBox,
                    //-------------------------------------------------------------------------
                    //Restaurants
                    HeadText(text: S.of(context).mostFamousRestaurants),
                    kSizedBox,
                    Card(
                      child: SizedBox(
                        height: 170,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => CachedNetworkImage(
                            imageUrl: listOfRestaurants[index],
                            height: 170,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          separatorBuilder: (_, index) => SizedBox(width: 15),
                          itemCount: listOfRestaurants.length,
                        ),
                      ),
                    ),

                    //-------------------------------------------------------------------------
                    //Gallery
                    HeadText(text: S.of(context).Gallery),
                    kSizedBox,
                    GalleryWidget(entity: mallEntity),
                    kSizedBox,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
