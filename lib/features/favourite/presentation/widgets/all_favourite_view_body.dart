import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/favourite/presentation/cubit/favourtie_cubit.dart';
import 'package:your_tour_guide/features/favourite/presentation/widgets/all_favourites_view_builder.dart';

class AllFavouritesViewBody extends StatefulWidget {
  const AllFavouritesViewBody({
    super.key,
  });

  @override
  State<AllFavouritesViewBody> createState() => _AllFavouritesViewBodyState();
}

class _AllFavouritesViewBodyState extends State<AllFavouritesViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteCubit>().getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return AllFavouritesViewBuilder();
  }
}
