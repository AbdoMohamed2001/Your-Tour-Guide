import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/malls/data/repos/mall_repo.dart';
import 'package:your_tour_guide/features/malls/domain/entities/mall_entity.dart';
import 'package:your_tour_guide/features/malls/presentation/cubit/mall_cubit.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../widgets/mall_details_view/mall_details_view_body.dart';

class MallDetailsView extends StatelessWidget {
  MallDetailsView({
    Key? key,
    required this.mallEntity,
  }) : super(key: key);
  static final String id = 'mallDetailsView';
  final MallEntity mallEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MallCubit(getIt<MallRepo>()),
        child: MallDetailsViewBody(mallEntity: mallEntity),
      ),
    );
  }
}
