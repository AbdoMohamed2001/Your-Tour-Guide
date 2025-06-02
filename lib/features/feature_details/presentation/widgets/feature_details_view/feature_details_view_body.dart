import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/feature_cubit.dart';
import 'feature_details_list_view_builder.dart';

class FeatureDetailsViewBody extends StatefulWidget {
  const FeatureDetailsViewBody({
    super.key,
    required this.collectionName,
  });

  final String collectionName;

  @override
  State<FeatureDetailsViewBody> createState() => _FeatureDetailsViewBodyState();
}

class _FeatureDetailsViewBodyState extends State<FeatureDetailsViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, dynamic>? query;
    if (widget.collectionName == 'places') {
      query = {
        'where': 'isBest',
        'orderBy': 'rate',
        'descending': true,
      };
    } else {
      query = {};
    }
    context.read<FeatureCubit>().getFeatureDetails(
          path: widget.collectionName,
          query: query,
        );
  }

  @override
  Widget build(BuildContext context) {
    return FeatureDetailsListViewBuilder(collectionName: widget.collectionName);
  }
}
