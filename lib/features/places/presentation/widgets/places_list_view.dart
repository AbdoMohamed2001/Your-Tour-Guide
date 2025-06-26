import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/places/domian/entities/place_entity.dart';
import 'package:your_tour_guide/core/utils/widgets/default_list_view.dart';

class PlacesListView extends StatelessWidget {
  const PlacesListView({
    super.key,
    required this.list,
  });

  final List<PlaceEntity> list;

  @override
  Widget build(BuildContext context) {
    return DefaultListView(
      list: list,
    );
  }
}
