import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/functions/get_user_data.dart';
import 'package:your_tour_guide/core/utils/functions/navigate_to_services_details_screen.dart';
import 'package:your_tour_guide/core/utils/theme/text_styles.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/grid_list_view.dart';
import 'package:your_tour_guide/features/favourite/data/models/favourite_model.dart';
import 'package:your_tour_guide/features/favourite/presentation/cubit/favourtie_cubit.dart';

import '../../../../generated/l10n.dart';
import '../../domain/entities/favourite_entity.dart';

class FavouritesViewBody extends StatefulWidget {
  const FavouritesViewBody({super.key});

  @override
  State<FavouritesViewBody> createState() => _FavouritesViewBodyState();
}

class _FavouritesViewBodyState extends State<FavouritesViewBody> {
  final Stream<QuerySnapshot> favStream = FirebaseFirestore.instance
      .collection('users')
      .doc(getUserData().id)
      .collection('favourites')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: favStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(S.of(context).someThingWrong);
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          List<FavouriteModel> favModels = snapshot.data!.docs
              .map((doc) => FavouriteModel.fromJson(doc))
              .toList();
          List<FavouriteEntity> favEntities =
              favModels.map((model) => model.toEntity()).toList();
          if (favEntities.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noFavouritesYet,
                style: TextStyles.bold18,
              ),
            );
          }
          return BlocListener<FavouriteCubit, FavouriteState>(
            listener: (context, state) {
              if (state is FavouritesGetEntitySuccess) {
                navigateToServiceDetailsScreen(
                  state.collectionName,
                  context,
                  state.entity,
                );
              }
            },
            child: GridListView(list: favEntities, isFavEntity: true),
          );
        }

        //ListView(
        //           children: snapshot.data!.docs.map((document) {
        //             Map<String, dynamic> data =
        //                 document.data()! as Map<String, dynamic>;
        //             return ListTile(
        //               title: Text(data['name']),
        //               subtitle: Text(data['nameArabic']),
        //             );
        //           }).toList(),
        //         );
      },
    );
  }
}

// class FavouriteStreamBuilder extends StatelessWidget {
//   const FavouriteStreamBuilder({super.key, required this.stream});
//
//   final Stream<List<FavouriteEntity>> stream;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<Either<Failure, List<FavouriteEntity>>>(
//       stream: context.read<FavouriteRepo>().getFavouritesStream(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return SliverToBoxAdapter(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return SliverToBoxAdapter(
//             child: Center(child: Text("Error loading Favourites")),
//           );
//         }
//
//         final favourites = snapshot.data ?? [];
//
//         return FavouriteGridListView(
//           list: favourites,
//           isFavEntity: true,
//         );
//       },
//     );
//   }
// }
//
List<FavouriteEntity> getDummyFavourites() {
  return [
    FavouriteEntity(
      docId: 'docId',
      name: 'name',
      nameArabic: 'nameArabic',
      cityName: 'cityName',
      cityNameArabic: 'cityNameArabic',
      imageUrl:
          'https://t4.ftcdn.net/jpg/02/44/43/69/360_F_244436923_vkMe10KKKiw5bjhZeRDT05moxWcPpdmb.jpg',
      collectionName: 'collectionName',
      rate: 4,
    ),
    FavouriteEntity(
      docId: 'docId',
      name: 'name',
      nameArabic: 'nameArabic',
      cityName: 'cityName',
      cityNameArabic: 'cityNameArabic',
      imageUrl:
          'https://t4.ftcdn.net/jpg/02/44/43/69/360_F_244436923_vkMe10KKKiw5bjhZeRDT05moxWcPpdmb.jpg',
      collectionName: 'collectionName',
      rate: 4,
    ),
  ];
}

// Stream<List<FavouriteEntity>> streamUserFavourites() {
//   return FirebaseFirestore.instance
//       .collection('users')
//       .doc(getUserData().id)
//       .collection('favourites')
//       .snapshots()
//       .asyncMap((snapshot) async {
//     final favDocs = snapshot.docs;
//     log('this is snapshots ${favDocs.toString()}');
//
//     if (favDocs.isEmpty) return [];
//
//     List<FavouriteModel> favIds =
//         favDocs.map((doc) => FavouriteModel.fromJson(doc)).toList();
//
//     // Get full product documents using the IDs
//     QuerySnapshot<Map<String, dynamic>> productQuery = await FirebaseFirestore
//         .instance
//         .collection('places')
//         .where(FieldPath.documentId, whereIn: favIds)
//         .get();
//
//     return productQuery.docs
//         .map((doc) => FavouriteModel.fromJson(doc.data()).toEntity())
//         .toList();
//   });
// }
