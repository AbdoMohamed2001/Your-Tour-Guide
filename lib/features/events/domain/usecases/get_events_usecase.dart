import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/features/events/domain/repos/event_repo.dart';

import '../entities/event_entity.dart';

class GetEventsUseCase {
  final EventRepo eventRepo;

  GetEventsUseCase(this.eventRepo);

  Future<Either<Failure, List<EventEntity>>> call({String? cityName}) async {
    return await eventRepo.getEvents(cityName: cityName);
  }
}
