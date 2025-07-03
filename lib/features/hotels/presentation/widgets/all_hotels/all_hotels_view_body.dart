import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:your_tour_guide/features/hotels/presentation/widgets/all_hotels/all_hotels_view_builder.dart';

class AllHotelsViewBody extends StatefulWidget {
  const AllHotelsViewBody({super.key});

  @override
  State<AllHotelsViewBody> createState() => _AllHotelsViewBodyState();
}

class _AllHotelsViewBodyState extends State<AllHotelsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<HotelCubit>().getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return AllHotelsViewBuilder();
  }
}
