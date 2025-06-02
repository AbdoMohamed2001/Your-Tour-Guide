import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/widgets/default_list_view.dart';

import '../../../../../core/domain/entities/feature_entity.dart';

class FeatureDetailsListView extends StatelessWidget {
  const FeatureDetailsListView({
    super.key,
    required this.features,
    required this.collectionName,
  });

  final List<FeatureEntity> features;
  final String collectionName;
  @override
  Widget build(BuildContext context) {
    return DefaultListView(
      list: features,
      collectionName: collectionName,
    );
  }
}
