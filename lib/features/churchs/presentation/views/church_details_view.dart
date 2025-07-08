import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/churchs/domain/entities/church_entity.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../../data/repos/church_repo.dart';
import '../cubit/church_cubit.dart';
import '../widgets/church_details_view/church_details_view_body.dart';

class ChurchDetailsView extends StatelessWidget {
  ChurchDetailsView({
    Key? key,
    required this.churchEntity,
  }) : super(key: key);
  static final String id = 'churchDetailsView';
  final ChurchEntity churchEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ChurchCubit(getIt<ChurchRepo>()),
        child: ChurchDetailsViewBody(churchEntity: churchEntity),
      ),
    );
  }
}
