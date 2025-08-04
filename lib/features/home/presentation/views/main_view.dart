import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/functions/show_toast.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/cubits/home/home_cubit.dart';
import '../../../../core/services/get_it_services_locator.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime timeBackPressed = DateTime.now();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return PopScope(
        canPop: getIt<HomeCubit>().currentIndex == 0,
        onPopInvoked: (didPop) async {
          if (didPop) return;

          if (getIt<HomeCubit>().currentIndex == 0) {
            final difference = DateTime.now().difference(timeBackPressed);
            final isExitWarning = difference >= Duration(seconds: 2);
            timeBackPressed = DateTime.now();

            if (isExitWarning) {
              showToast(msg: 'Press back again to exit');
            } else {
              Fluttertoast.cancel();
              SystemNavigator.pop(); // Actually exit the app
            }
          } else {
            getIt<HomeCubit>().changeIndex(0);
          }
        },
        child: Scaffold(
          bottomNavigationBar: AnimatedBottomNavigationBar(
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            icons: getIt<HomeCubit>().iconList,
            activeIndex: getIt<HomeCubit>().currentIndex,
            activeColor: AppColors.primaryColor,
            gapWidth: 0,
            onTap: (index) {
              getIt<HomeCubit>().changeIndex(index);
            },
          ),
          body: getIt<HomeCubit>().pages[getIt<HomeCubit>().currentIndex],
        ),
      );
    });
  }
}
