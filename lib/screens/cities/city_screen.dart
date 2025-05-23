// ignore_for_file: missing_required_param

import 'package:your_tour_guide/cubits/city_model/city_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import 'package:your_tour_guide/widgets/list_view_all_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityScreen extends StatelessWidget {
  CityScreen({
    Key? key,
    required this.cityName,
  }) : super(key: key);
  static String id = 'cityScreen';
  final String cityName;

  @override
  Widget build(BuildContext context) {
    DocumentReference city = FirebaseFirestore.instance.collection('cities').doc(cityName);

    return BlocProvider(
      create: (context) => CityCubit(),
      child: FutureBuilder<DocumentSnapshot>(
        future: city.get(),
        builder: (context, snapshot) {
          var cityCubit = CityCubit.get(context);
          cityCubit.cityName = snapshot.data?['cityName'].toString();
          if (snapshot.data == null) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ),
            );
          }
          else if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: CustomAppBar(
                title: snapshot.data![S.of(context).cityName].toString(),
                leading: CustomAppBarIconButton(),
              ),
              body: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => BuildAllItem(
                  index: index,
                  pushedPage: cityCubit.listOfCityModel[index].pushedPage,
                  itemNameOnFireBase: cityCubit.listOfCityModel[index].name,
                  imageUrl: snapshot.data!['${cityCubit.listOfCityModel[index].image}'],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: cityCubit.listOfCityModel.length,
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            ),
          );
        },
      ),
    );
  }
}

