import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:your_tour_guide/features/hotels/presentation/widgets/all_hotels/all_hotels_list_view.dart';

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
          return HotelsListView(list: allHotels);
        }
      },
    );
  }
}
