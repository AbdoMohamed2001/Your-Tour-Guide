import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/hotels/data/repos/hotels_repo.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter/material.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';

import '../../../../core/services/get_it_services_locator.dart';
import '../widgets/hotel_view/hotel_details_view_body.dart';

class HotelDetailsView extends StatelessWidget {
  HotelDetailsView({
    Key? key,
    required this.hotelEntity,
  }) : super(key: key);
  final HotelEntity hotelEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HotelCubit(getIt<HotelsRepo>()),
        child: HotelDetailsViewBody(hotelEntity: hotelEntity),
      ),
    );
  }
}
