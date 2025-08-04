import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/favourite/data/models/favourite_model.dart';
import '../../../../features/favourite/presentation/cubit/favourtie_cubit.dart';
import '../../functions/is_arabic.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    super.key,
    required this.entity,
  });

  final dynamic entity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: isArabic() ? null : 16,
      left: isArabic() ? 16 : null,
      child: BlocConsumer<FavouriteCubit, FavouriteState>(
        listener: (context, state) {
          if (state is FavouriteToggleFailure) {
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
          return InkWell(
            onTap: isLoading
                ? null
                : () {
                    final model = FavouriteModel(
                      docId: entity.docId,
                      name: entity.name,
                      nameArabic: entity.nameArabic,
                      imageUrl: entity.imageUrl,
                      cityName: entity.cityName,
                      cityNameArabic: entity.cityNameArabic,
                      collectionName: entity.collectionRef,
                      rate: entity.rate,
                    );
                    context.read<FavouriteCubit>().toggle(model);
                  },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).cardColor,
              child: isFav
                  ? Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                      size: 25,
                    )
                  : Icon(
                      Icons.favorite_border_rounded,
                      color: Theme.of(context).primaryColorDark,
                      size: 25,
                    ),
            ),
          );
        },
      ),
    );
  }
}
