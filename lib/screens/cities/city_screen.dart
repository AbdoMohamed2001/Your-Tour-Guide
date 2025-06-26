// ignore_for_file: missing_required_param

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CityView extends StatelessWidget {
  CityView({
    Key? key,
    required this.cityName,
  }) : super(key: key);
  static String id = 'CityView';
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

//    return BlocProvider(
//       create: (context) => CityCubit(),
//       child: FutureBuilder<DocumentSnapshot>(
//         future: city.get(),
//         builder: (context, snapshot) {
//           var cityCubit = CityCubit.get(context);
//           cityCubit.cityName = snapshot.data?['cityName'].toString();
//           if (snapshot.data == null) {
//             return Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.orange,
//                 ),
//               ),
//             );
//           } else if (snapshot.connectionState == ConnectionState.done) {
//             return Scaffold(
//               appBar: CustomAppBar(
//                 title: snapshot.data![S.of(context).cityName].toString(),
//                 leading: CustomAppBarIconButton(),
//               ),
//               body: ListView.separated(
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) => BuildAllItem(
//                   index: index,
//                   pushedPage: cityCubit.listOfCityModel[index].pushedPage,
//                   itemNameOnFireBase: cityCubit.listOfCityModel[index].name,
//                   imageUrl: snapshot
//                       .data!['${cityCubit.listOfCityModel[index].image}'],
//                 ),
//                 separatorBuilder: (context, index) => SizedBox(
//                   height: 10,
//                 ),
//                 itemCount: cityCubit.listOfCityModel.length,
//               ),
//             );
//           }
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(
//                 color: Colors.orange,
//               ),
//             ),
//           );
//         },
//       ),
//     );
