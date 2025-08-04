import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/events/domain/entities/event_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class EventRepo {
  Future<Either<Failure, List<EventEntity>>> getEvents({String? cityName});
}
