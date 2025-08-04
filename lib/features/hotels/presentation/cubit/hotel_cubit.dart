import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:your_tour_guide/features/hotels/data/repos/hotels_repo.dart';
import 'package:your_tour_guide/features/hotels/domain/entities/hotel_entity.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  static HotelCubit get(context) => BlocProvider.of(context);
  HotelCubit(this.hotelsRepo) : super(HotelInitial());
  final HotelsRepo hotelsRepo;
  List<HotelEntity> allHotels = [];

  void getHotels({String? cityName}) async {
    emit(HotelsGetLoading());

    var result = await hotelsRepo.getHotels();
    result.fold(
      (fail) {
        emit(HotelsGetFailure(message: fail.message));
      },
      (hotels) {
        allHotels = hotels;
        emit(HotelsGetSuccess(hotels: allHotels));
      },
    );
  }
}
