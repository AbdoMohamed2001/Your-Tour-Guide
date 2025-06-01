import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/data/repos/features_repo.dart';
import 'package:your_tour_guide/core/domain/entities/feature_entity.dart';
import 'package:your_tour_guide/core/services/get_it_services_locator.dart';
import 'package:your_tour_guide/widgets/custom_app_bar.dart';

import '../../../../constants.dart';
import '../../../../widgets/deafult_cached_network_image.dart';
import '../../../feature_details/presentation/cubits/feature_cubit.dart';

class FeatureDetailsView extends StatelessWidget {
  const FeatureDetailsView({
    super.key,
    required this.collectionName,
  });

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
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
    var query;
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
    return FeatureDetailsListViewBuilder();
  }
}

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
        imageUrl: features[i].imageUrl,
        name: features[i].name,
      ),
      itemCount: features.length,
    );
  }
}

class FeatureDetailsListViewItem extends StatelessWidget {
  const FeatureDetailsListViewItem({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return pushedPage;
        // }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 0.75),
                ),
              ],
            ),
            child: Stack(
              children: [
                DefaultCachedNetworkImage(imageUrl: imageUrl, imageHeight: 200),
                Positioned(
                  top: 145,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: BorderedText(
                      strokeColor: Colors.black,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.butt,
                      strokeJoin: StrokeJoin.bevel,
                      child: Text(
                        textAlign: TextAlign.center,
                        '$name',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //Done
              ],
            ),
          ),
        ),
      ),
    );
  }
}
