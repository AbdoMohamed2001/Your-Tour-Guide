import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import '../../../../core/cubits/home/home_cubit.dart';
import '../../../../core/utils/text_styles.dart';

class ExploreMore extends StatelessWidget {
  const ExploreMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).Explore, style: TextStyles.bold28),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (HomeCubit.get(context).isDark == true) {
                      HomeCubit.get(context).changeThemeMode(true);
                    } else {
                      HomeCubit.get(context).changeThemeMode(false);
                    }
                  },
                  icon: Icon(Icons.dark_mode),
                ),
                //
                PopupMenuButton(
                    icon: Icon(
                      Icons.language,
                    ),
                    itemBuilder: (_) {
                      return [
                        PopupMenuItem(
                          child: Text('Arabic'),
                          onTap: () {
                            context.read<HomeCubit>().changeLanguage('ar');
                          },
                        ),
                        PopupMenuItem(
                          child: Text('English'),
                          onTap: () {
                            context.read<HomeCubit>().changeLanguage('en');
                          },
                        ),
                      ];
                    }),
              ],
            ),
          ],
        ),
        // More about Egypt
        Text(
          S.of(context).moreAboutEgypt,
          style: TextStyles.bold28,
        ),
      ],
    );
  }
}

//Function to add field to all docs

//          onLongPress: () {
//             addFieldToAllDocuments(
//               collectionPath: 'cities',
//               fieldName: 'services',
//               fieldValue: [
//                 //Places
//                 {
//                   "name": 'Places',
//                   "nameArabic": 'الأماكن',
//                   "imageUrl": '',
//                   "collectionRef": "places",
//                 },
//                 //Hotels
//                 {
//                   "name": 'Hotels',
//                   "nameArabic": 'الفنادق',
//                   "imageUrl": '',
//                   "collectionRef": 'hotels',
//                 },
//                 //Restaurants
//                 {
//                   "name": 'Restaurants',
//                   "nameArabic": 'المطاعم',
//                   "imageUrl": '',
//                   "collectionRef": "restaurants",
//                 },
//                 //Cafes
//                 {
//                   "name": 'Cafes',
//                   "nameArabic": 'المقاهى',
//                   "imageUrl": '',
//                   "collectionRef": 'cafes',
//                 },
//                 //Malls
//                 {
//                   "name": 'Malls',
//                   "nameArabic": 'المولات',
//                   "imageUrl": '',
//                   "collectionRef": 'malls',
//                 },
//                 //Cinemas
//                 {
//                   "name": 'Cinemas',
//                   "nameArabic": 'السينيمات',
//                   "imageUrl": '',
//                   "collectionRef": 'cinemas',
//                 },
//                 //Mosques
//                 {
//                   "name": 'Mosques',
//                   "nameArabic": 'المساجد',
//                   "imageUrl": '',
//                   "collectionRef": "mosques",
//                 },
//                 //Churchs
//                 {
//                   "name": 'Churchs',
//                   "nameArabic": 'الكنائس',
//                   "imageUrl": '',
//                   "collectionRef": 'churchs',
//                 },
//                 //TourGuides
//                 {
//                   "name": 'Tour Guides',
//                   "nameArabic": 'المرشدين السياحين',
//                   "imageUrl": '',
//                   "collectionRef": "tourGuides",
//                 },
//                 //Tour Companies
//                 {
//                   "name": 'Tour Companies',
//                   "nameArabic": 'شركات السياحة',
//                   "imageUrl": '',
//                   "collectionRef": "tourCompanies",
//                 },
//               ],
//             );
//           },
