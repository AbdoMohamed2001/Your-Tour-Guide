import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_tour_guide/features/hotels/data/repos/hotels_repo.dart';
import 'package:your_tour_guide/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:your_tour_guide/features/hotels/presentation/widgets/all_hotels/all_hotels_view_body.dart';
import 'package:your_tour_guide/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/get_it_services_locator.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class AllHotelsView extends StatelessWidget {
  static String id = 'AllHotelsView';
  final String cityName;

  AllHotelsView({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).AllHotels,
        leading: CustomAppBarIconButton(),
      ),
      body: BlocProvider(
        create: (context) => HotelCubit(getIt<HotelsRepo>()),
        child: AllHotelsViewBody(),
      ),
    );
  }
}
