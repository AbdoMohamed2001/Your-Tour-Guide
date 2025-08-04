import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/core/errors/failure.dart';
import 'package:your_tour_guide/core/usecases/usecase.dart';
import 'package:your_tour_guide/features/events/data/repos/event_repo.dart';

import '../entities/event_entity.dart';

class GetEventsUseCase extends UseCase<List<EventEntity>, String?> {
  final EventRepo eventRepo;

  GetEventsUseCase(this.eventRepo);

  @override
  Future<Either<Failure, List<EventEntity>>> call({String? params}) async {
    return await eventRepo.getEvents(cityName: params);
  }
}
