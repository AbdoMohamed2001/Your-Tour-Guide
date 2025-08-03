// import 'package:flutter/material.dart';
// import 'package:local_hero_transform/local_hero_transform.dart';
//
// class LocalHeroExample extends StatefulWidget {
//   const LocalHeroExample({super.key});
//
//   @override
//   State<LocalHeroExample> createState() => _LocalHeroExampleState();
// }
//
// class _LocalHeroExampleState extends State<LocalHeroExample>
//     with SingleTickerProviderStateMixin {
//   late final TabController _tabController;
//   late final ValueNotifier<FavoriteShape> _viewModeNotifier;
//   late final ValueNotifier<bool> _loadingNotifier;
//
//   @override
//   void initState() {
//     super.initState();
//     _viewModeNotifier = ValueNotifier(FavoriteShape.grid);
//     _loadingNotifier = ValueNotifier(false);
//     _tabController = TabController(length: 2, vsync: this)
//       ..addListener(_handleTabChange);
//   }
//
//   void _handleTabChange() {
//     if (!_tabController.indexIsChanging) {
//       _viewModeNotifier.value =
//           _tabController.index == 0 ? FavoriteShape.grid : FavoriteShape.list;
//     }
//   }
//
//   @override
//   void dispose() {
//     _tabController
//       ..removeListener(_handleTabChange)
//       ..dispose();
//     _viewModeNotifier.dispose();
//     _loadingNotifier.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(context),
//       body: _buildBody(),
//     );
//   }
//
// //BODY
//   Widget _buildBody() {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: ValueListenableBuilder<bool>(
//           valueListenable: _loadingNotifier,
//           builder: (context, _, child) {
//             return LocalHeroViews(
//               onPressedCard: _handleCardPressed,
//               textDirection: TextDirection.ltr,
//               itemCount: locations.length,
//               itemsModel: _buildItemsModel,
//               tabController: _tabController,
//             );
//           }),
//     );
//   }
//
//   void _handleCardPressed(int index) {
//     final location = locations[index];
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) =>
//             DetailsScreen(name: location.name, imageUrl: location.imageUrl),
//       ),
//     );
//   }
//
//   ItemsModel _buildItemsModel(int index) {
//     final location = locations[index];
//     final textTheme = _buildTextTheme();
//
//     return ItemsModel(
//       cardStyleMode: CardStyleMode(
//         isDarkMode: true,
//         isLoading: _loadingNotifier.value,
//       ),
//       image: DecorationImage(
//           image: NetworkImage(location.imageUrl), fit: BoxFit.cover),
//       name: Text(location.name, style: textTheme.name),
//       title: Text(location.place, style: textTheme.title),
//       subTitle: Text(location.subtitle, style: textTheme.subTitle),
//       subTitleIcon: Icon(
//         Icons.location_on_outlined,
//         color: AppColors.subtitleColor,
//         size: MediaQuery.sizeOf(context).width * 0.03,
//       ),
//       favoriteIconButton: _buildFavoriteButton(),
//     );
//   }
//
//   _TextTheme _buildTextTheme() {
//     return _TextTheme(
//       name: TextStyle(
//         color: Colors.white,
//         fontSize: 16,
//         fontWeight: FontWeight.w500,
//       ),
//       title: TextStyle(
//         color: Colors.blue,
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//       ),
//       subTitle: TextStyle(
//         color: AppColors.subtitleColor,
//         fontSize: 13,
//         fontWeight: FontWeight.w400,
//       ),
//     );
//   }
//
//   Widget _buildFavoriteButton() {
//     bool isFavored = true;
//     return StatefulBuilder(
//       builder: (context, setState) {
//         return IconButton(
//           style: ButtonStyle(
//             backgroundColor: WidgetStateProperty.resolveWith<Color>(
//               (states) => isFavored ? Colors.redAccent : Colors.grey,
//             ),
//           ),
//           icon: Icon(
//             Icons.favorite,
//             color: Colors.white,
//             size: MediaQuery.sizeOf(context).width * 0.06,
//           ),
//           onPressed: () => setState(() => isFavored = !isFavored),
//         );
//       },
//     );
//   }
//
// //APPBAR
//   AppBar _buildAppBar(BuildContext context) {
//     return AppBar(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
//       centerTitle: true,
//       title: Text('Hero Without Transform'),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: _buildViewToggleButton(),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildViewToggleButton() {
//     return ValueListenableBuilder<FavoriteShape>(
//       valueListenable: _viewModeNotifier,
//       builder: (context, value, _) => ConstrainedBox(
//         constraints: BoxConstraints.tight(Size(35, 35)),
//         child: AspectRatio(
//           aspectRatio: 1.9 / 2,
//           child: RawMaterialButton(
//             onPressed: () {
//               final newIndex = _tabController.index == 0 ? 1 : 0;
//               _tabController.animateTo(newIndex);
//             },
//             elevation: 0,
//             visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(color: Colors.black, width: 0.2),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             fillColor: Colors.blue,
//             child: Icon(
//               value == FavoriteShape.grid
//                   ? Icons.grid_view_rounded
//                   : Icons.view_agenda_outlined,
//               size: 16,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _TextTheme {
//   final TextStyle name;
//   final TextStyle title;
//   final TextStyle subTitle;
//
//   const _TextTheme({
//     required this.name,
//     required this.title,
//     required this.subTitle,
//   });
// }
//
// class AppColors {
//   static const backgroundColor = Color(0xFFF2F3F8);
//   static const darkBackgroundColor = Color(0xff10122C);
//   static const darkCardColor = Color.fromARGB(255, 36, 39, 92);
//   static const darkItemColor = Color.fromARGB(255, 13, 13, 29);
//   static const darkShimmerColor = Color.fromARGB(255, 36, 39, 92);
//   static const lightItemColor = Color(0xFFEEEEEE);
//   static const subtitleColor = Color(0xFF95979A);
// }
//
// enum FavoriteShape { grid, list }
//
// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({
//     super.key,
//     required this.name,
//     required this.imageUrl,
//   });
//
//   final String name;
//   final String imageUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigoAccent,
//         iconTheme: IconThemeData(color: Colors.white),
//         title: Text(name, style: TextStyle(color: Colors.white)),
//       ),
//       body: Center(
//         child: AspectRatio(
//           aspectRatio: 16 / 14,
//           child: Image.network(imageUrl, fit: BoxFit.cover),
//         ),
//       ),
//     );
//   }
// }
//
// class Location {
//   final String name;
//   final String place;
//   final String imageUrl;
//   final String subtitle;
//
//   const Location({
//     required this.name,
//     required this.place,
//     required this.imageUrl,
//     required this.subtitle,
//   });
// }
//
// const urlPrefix =
//     'https://docs.flutter.dev/cookbook/img-files/effects/parallax';
//
// const locations = [
//   Location(
//     name: 'Mount ',
//     place: 'U.S.A',
//     imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
//     subtitle: 'Presidential monument',
//   ),
//   Location(
//     name: 'Gardens ',
//     place: 'Singapore',
//     imageUrl: '$urlPrefix/02-singapore.jpg',
//     subtitle: 'Futuristic gardens',
//   ),
//   Location(
//     name: 'Machu Picchu',
//     place: 'Peru',
//     imageUrl: '$urlPrefix/03-machu-picchu.jpg',
//     subtitle: 'Ancient Inca city',
//   ),
//   Location(
//     name: 'Vitznau',
//     place: 'Switzerland',
//     imageUrl: '$urlPrefix/04-vitznau.jpg',
//     subtitle: 'Lakeside village',
//   ),
//   Location(
//     name: 'Bali',
//     place: 'Indonesia',
//     imageUrl: '$urlPrefix/05-bali.jpg',
//     subtitle: 'Tropical paradise',
//   ),
//   Location(
//     name: 'Mexico City',
//     place: 'Mexico',
//     imageUrl: '$urlPrefix/06-mexico-city.jpg',
//     subtitle: 'Vibrant capital',
//   ),
//   Location(
//     name: 'Cairo',
//     place: 'Egypt',
//     imageUrl: '$urlPrefix/07-cairo.jpg',
//     subtitle: 'Pyramids city',
//   ),
//   Location(
//     name: 'Yemen',
//     place: "Sana'a",
//     imageUrl: '$urlPrefix/07-cairo.jpg',
//     subtitle: 'Ancient architecture',
//   ),
// ];
