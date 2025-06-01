import 'package:flutter/material.dart';

import '../../../../core/domain/entities/feature_entity.dart';
import 'feature_details_list_view_item.dart';

class FeatureDetailsListView extends StatelessWidget {
  const FeatureDetailsListView({
    super.key,
    required this.features,
  });

  final List<FeatureEntity> features;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemBuilder: (_, i) => FeatureDetailsListViewItem(
        featureEntity: features[i],
      ),
      itemCount: features.length,
    );
  }
}
