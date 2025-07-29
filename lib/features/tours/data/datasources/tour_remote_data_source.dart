import 'package:your_tour_guide/core/services/database_services.dart';
import 'package:your_tour_guide/features/tours/data/models/tour_model.dart';

import '../../../../core/utils/backend_endpoints.dart';

abstract class TourRemoteDataSource {
  Future<List<TourModel>> getTours({String? type});
}

class TourRemoteDataSourceImpl implements TourRemoteDataSource {
  final DatabaseServices databaseServices;

  TourRemoteDataSourceImpl({required this.databaseServices});

  @override
  Future<List<TourModel>> getTours({String? type}) async {
    List<Map<String, dynamic>> data = await databaseServices.getData(
      path: BackEndEndPoints.toursCollection,
      whereFieldValue: type,
      query: {
        'where': 'type',
      },
    );
    List<TourModel> tourModels =
        data.map((e) => TourModel.fromJson(e)).toList();
    return tourModels;
  }
}
