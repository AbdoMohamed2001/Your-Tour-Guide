import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:your_tour_guide/features/events/domain/entities/event_entity.dart';
import 'package:your_tour_guide/features/events/domain/usecases/get_events_usecase.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this.getEventsUseCase) : super(EventInitial());

  final GetEventsUseCase getEventsUseCase;
  List<EventEntity> allEvents = [];

  void getEvents({String? cityName}) async {
    emit(EventLoading());

    var result = await getEventsUseCase.call();
    result.fold(
      (fail) {
        emit(EventFailure(fail.message));
      },
      (events) {
        allEvents = events;
        emit(EventSuccess(allEvents));
      },
    );
  }
}
