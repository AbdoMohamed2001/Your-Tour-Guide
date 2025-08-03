import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:your_tour_guide/features/hotels/presentation/widgets/all_hotels/all_hotels_view_builder.dart';

class HotelsViewBody extends StatefulWidget {
  const HotelsViewBody({super.key, required this.tabController});
  final TabController tabController;
  @override
  State<HotelsViewBody> createState() => _HotelsViewBodyState();
}

class _HotelsViewBodyState extends State<HotelsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<HotelCubit>().getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return HotelsViewBuilder(tabController: widget.tabController);
  }
}
