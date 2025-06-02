import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/data/repos/features_repo.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';
import '../cubits/feature_cubit.dart';
import '../widgets/feature_details_view_body.dart';

class FeatureDetailsView extends StatelessWidget {
  const FeatureDetailsView({
    super.key,
    required this.collectionName,
    required this.appBarTitle,
  });

  final String collectionName;
  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appBarTitle,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => FeatureCubit(getIt.get<FeaturesRepo>()),
        child: FeatureDetailsViewBody(
          collectionName: collectionName,
        ),
      ),
    );
  }
}
