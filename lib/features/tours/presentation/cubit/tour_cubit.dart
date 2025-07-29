import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:your_tour_guide/features/tours/domain/entities/tour_entity.dart';
import 'package:your_tour_guide/features/tours/domain/usecases/get_tours_usecase.dart';

part 'tour_state.dart';

class TourCubit extends Cubit<TourState> {
  TourCubit(this.getToursUseCase) : super(TourInitial());
  final GetToursUseCase getToursUseCase;
  List<TourEntity> allTours = [];
  void getTours({String? tourType}) async {
    emit(TourLoading());

    var result = await getToursUseCase.call(tourType: tourType);
    result.fold(
      (fail) {
        emit(TourFailure(fail.message));
      },
      (events) {
        allTours = events;
        emit(TourSuccess(allTours));
      },
    );
  }
}
