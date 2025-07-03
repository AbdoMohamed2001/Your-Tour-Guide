import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/cafes/data/repos/cafe_repo.dart';
import 'package:your_tour_guide/features/cafes/domain/entities/cafe_entity.dart';
import 'package:your_tour_guide/features/cafes/presentation/cubit/cafe_cubit.dart';

import '../../../../core/services/get_it_services_locator.dart';

class CafeDetailsView extends StatelessWidget {
  CafeDetailsView({
    Key? key,
    required this.cafeEntity,
  }) : super(key: key);
  static final String id = 'CafeDetailsView';
  final CafeEntity cafeEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CafeCubit(getIt<CafeRepo>()),
        child: CafeDetailsView(cafeEntity: cafeEntity),
      ),
    );
  }
}
