import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/core/utils/widgets/custom-grid-view/grid_list_view.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';

class AllHotelsViewBuilder extends StatelessWidget {
  const AllHotelsViewBuilder({super.key});

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
          return GridListView(list: allHotels);
        }
      },
    );
  }
}
