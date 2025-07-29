import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/grid_list_view.dart';
import 'package:your_tour_guide/features/tours/domain/entities/tour_type_entity.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';

class AllTours extends StatelessWidget {
  static String id = 'AllTours';

  const AllTours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllTours,
        leading: CustomAppBarIconButton(),
      ),
      body: GridListView(
        list: tourTypes,
        isTourType: true,
      ),
    );
  }
}
