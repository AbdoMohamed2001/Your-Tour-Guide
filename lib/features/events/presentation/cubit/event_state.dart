part of 'event_cubit.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}

final class EventLoading extends EventState {}

final class EventSuccess extends EventState {
  final List<EventEntity> events;

  EventSuccess(this.events);
}

final class EventFailure extends EventState {
  final String message;

  EventFailure(this.message);
}
