import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/places/domain/entities/place_entity.dart';
import 'package:your_tour_guide/core/utils/widgets/default_list_view.dart';
import 'package:your_tour_guide/features/places/presentation/views/place_details_view.dart';

class PlacesListView extends StatelessWidget {
  const PlacesListView({
    super.key,
    required this.list,
  });

  final List<PlaceEntity> list;

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
              builder: (context) => PlaceDetailsView(
                placeEntity: list[i],
              ),
            ),
          );
        },
      ),
      itemCount: list.length,
    );
  }
}
