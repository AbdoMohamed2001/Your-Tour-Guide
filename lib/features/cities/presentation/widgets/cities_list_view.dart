import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/default_list_view.dart';

class CitiesListView extends StatelessWidget {
  const CitiesListView({
    super.key,
    required this.list,
  });

  final List<dynamic> list;
  @override
  Widget build(BuildContext context) {
    return DefaultListView(list: list);
  }
}
