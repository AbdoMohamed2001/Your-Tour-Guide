import 'package:your_tour_guide/features/nav_bar/presentation/widgets/profile_view/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  static String id = '  ProfileView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileViewBody(),
    );
  }
}
