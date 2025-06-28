import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/widgets/default_list_view.dart';
import 'package:your_tour_guide/features/cities/presentation/views/city_view.dart';

class CitiesListView extends StatelessWidget {
  const CitiesListView({
    super.key,
    required this.list,
  });

  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemBuilder: (_, i) => DefaultListViewItem(
        entity: list[i],
        list: list,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CityView(
                cityEntity: list[i],
              ),
            ),
          );
        },
      ),
      itemCount: list.length,
    );
  }
}
