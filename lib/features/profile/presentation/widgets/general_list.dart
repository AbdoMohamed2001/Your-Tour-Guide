import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';

import '../../../../core/cubits/home/home_cubit.dart';
import '../cubit/profile_cubit.dart';
import '../views/edit_profile_view.dart';
import 'general_item.dart';
import 'general_list_items.dart';

class GeneralList extends StatelessWidget {
  const GeneralList({
    super.key,
    required this.deviceHeight,
  });

  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Personal Information
        GeneralItem(
          image: generalList(context)[0].icon,
          text: generalList(context)[0].text,
          containsArrow: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<ProfileCubit>(),
                  child: EditProfileView(),
                ),
              ),
            );
          },
        ),
        SizedBox(height: deviceHeight * 0.02),
        //Favourites
        GeneralItem(
          image: generalList(context)[1].icon,
          text: generalList(context)[1].text,
          containsArrow: true,
          onTap: () {
            getIt<HomeCubit>().changeIndex(2);
          },
        ),
        SizedBox(height: deviceHeight * 0.02),
        //Language
        GeneralItem(
          image: generalList(context)[3].icon,
          text: generalList(context)[3].text,
          isLanguage: true,
        ),
        SizedBox(height: deviceHeight * 0.02),
        //Mode
        GeneralItem(
          image: generalList(context)[4].icon,
          text: generalList(context)[4].text,
          isCustomSwitch: true,
        ),
      ],
    );
  }
}
