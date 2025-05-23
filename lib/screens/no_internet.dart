import 'package:your_tour_guide/generated/l10n.dart';
import 'package:your_tour_guide/screens/homePage/main_view.dart';
import 'package:your_tour_guide/widgets/none_app_bar.dart';
import 'package:flutter/material.dart';

class InternetNotAvailable extends StatelessWidget {
  const InternetNotAvailable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NoneAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              S.of(context).noInternet,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return MainView();
              }));
            },
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Retry',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
