import 'package:your_tour_guide/constants.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var HomeCubitClass = HomeCubit.get(context);
          return GestureDetector(
            onTap: () {
              HomeCubitClass.updateUi();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 8, left: 8),
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(
                    bottom: 3.5, top: 3.5, right: 2.0, left: 2.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Center(
                    child: Text(
                  S.of(context).startSearch,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
