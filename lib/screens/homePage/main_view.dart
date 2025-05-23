import 'package:your_tour_guide/components.dart';
import 'package:your_tour_guide/cubits/home/home_cubit.dart';
import 'package:your_tour_guide/screens/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  static final String id = 'homeScreen';

  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    DateTime timeBackPressed = DateTime.now();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        return Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : PopScope(
                canPop: homeCubit.currentIndex == 0,
                onPopInvoked: (didPop) async {
                  if (didPop) return; // System pop already handled

                  if (homeCubit.currentIndex == 0) {
                    final difference =
                        DateTime.now().difference(timeBackPressed);
                    final isExitWarning = difference >= Duration(seconds: 2);
                    timeBackPressed = DateTime.now();

                    if (isExitWarning) {
                      showToast(msg: 'Press back again to exit');
                    } else {
                      Fluttertoast.cancel();
                      SystemNavigator.pop(); // Actually exit the app
                    }
                  } else {
                    homeCubit.changeIndex(0);
                  }
                },
                child: Scaffold(
                  bottomNavigationBar: AnimatedBottomNavigationBar(
                    backgroundColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    icons: homeCubit.iconList,
                    activeIndex: homeCubit.currentIndex,
                    activeColor: Colors.orange,
                    gapWidth: 0,
                    onTap: (index) {
                      homeCubit.changeIndex(index);
                    },
                  ),
                  body: homeCubit.pages[homeCubit.currentIndex],
                ),
              );
      },
    );
  }
}
