import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/feature_entity.dart';
import '../cubits/feature_cubit.dart';
import 'feature_details_list_view.dart';

class FeatureDetailsListViewBuilder extends StatelessWidget {
  const FeatureDetailsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureCubit, FeatureState>(
      builder: (context, state) {
        final cubit = context.read<FeatureCubit>();
        final List<FeatureEntity> features = cubit.features;
        if (state is FeatureLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FeatureFailure) {
          return const Center(child: Text('Failed to load featured places'));
        } else {
          return FeatureDetailsListView(
            features: features,
          );
        }
      },
    );
  }
}
