import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:your_tour_guide/features/events/data/datasources/event_remote_data_source.dart';
import 'package:your_tour_guide/features/events/domain/entities/event_entity.dart';

import '../../../../core/errors/failure.dart';

import '../../data/repos/event_repo.dart';

class EventRepoImpl extends EventRepo {
  final EventRemoteDataSource eventRemoteDataSource;

  EventRepoImpl(this.eventRemoteDataSource);
  @override
  Future<Either<Failure, List<EventEntity>>> getEvents(
      {String? cityName}) async {
    try {
      final result = await eventRemoteDataSource.getEvents();
      List<EventEntity> events =
          result.map((model) => model.toEntity()).toList();
      return right(events);
    } catch (e, stack) {
      log(stack.toString());
      log('there is error in getAllEvents in repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }
}
