import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/mosques/data/repos/mosque_repo.dart';
import 'package:your_tour_guide/features/mosques/domain/entities/mosque_entity.dart';
import 'package:your_tour_guide/features/mosques/presentation/cubit/mosque_cubit.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../widgets/mosque_details_view/mosque_details_view_body.dart';

class MosqueDetailsView extends StatelessWidget {
  MosqueDetailsView({
    Key? key,
    required this.mosqueEntity,
  }) : super(key: key);
  static final String id = 'MosqueDetailsView';
  final MosqueEntity mosqueEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MosqueCubit(getIt<MosqueRepo>()),
        child: MosqueDetailsViewBody(mosqueEntity: mosqueEntity),
      ),
    );
  }
}
