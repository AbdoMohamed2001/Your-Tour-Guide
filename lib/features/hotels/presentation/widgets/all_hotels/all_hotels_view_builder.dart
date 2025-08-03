import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';

import '../../../../../core/utils/widgets/local_hero/local_hero_body.dart';

class HotelsViewBuilder extends StatelessWidget {
  const HotelsViewBuilder({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        final cubit = context.read<HotelCubit>();
        final List<HotelEntity> allHotels = cubit.allHotels;
        if (state is HotelsGetLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HotelsGetFailure) {
          return const Center(child: Text('Failed to load featured places'));
        } else {
          return LocalHeroBody(
            tabController: tabController,
            entities: allHotels,
          );
        }
      },
    );
  }
}
