import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';
import 'package:your_tour_guide/features/hotels/presentation/widgets/all_hotels/hotels_grid_item.dart';

class HotelsListView extends StatelessWidget {
  const HotelsListView({
    super.key,
    required this.list,
  });

  final List<HotelEntity> list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5 / 3,
            crossAxisCount: 2,
          ),
          itemBuilder: (_, i) => HotelsGridItem(hotelEntity: list[i]),
          itemCount: list.length,
        ),
      ],
    );
  }
}
