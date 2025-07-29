import 'package:your_tour_guide/core/services/database_services.dart';
import 'package:your_tour_guide/features/events/data/models/event_model.dart';

import '../../../../core/utils/backend_endpoints.dart';

abstract class EventRemoteDataSource {
  Future<List<EventModel>> getEvents();
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  final DatabaseServices databaseServices;

  EventRemoteDataSourceImpl({required this.databaseServices});

  @override
  Future<List<EventModel>> getEvents({String? cityName}) async {
    List<Map<String, dynamic>> data = await databaseServices.getData(
      path: BackEndEndPoints.eventsCollection,
      whereFieldValue: cityName,
      query: {
        'where': 'cityName',
      },
    );
    List<EventModel> eventModels =
        data.map((e) => EventModel.fromJson(e)).toList();
    return eventModels;
  }
}
