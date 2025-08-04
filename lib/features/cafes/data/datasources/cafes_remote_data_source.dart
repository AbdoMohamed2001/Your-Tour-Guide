import 'package:your_tour_guide/core/services/database_services.dart';

import '../../../../core/utils/backend_endpoints.dart';
import '../models/cafe_model.dart';

abstract class CafesRemoteDataSource {
  Future<List<CafeModel>> getCafes({String? cityName});
}

class CafesRemoteDataSourceImpl implements CafesRemoteDataSource {
  final DatabaseServices databaseServices;

  CafesRemoteDataSourceImpl({required this.databaseServices});

  @override
  Future<List<CafeModel>> getCafes({String? cityName}) async {
    List<Map<String, dynamic>> data = await databaseServices.getData(
      path: BackEndEndPoints.cafesCollection,
      whereFieldValue: cityName,
      query: {
        'where': 'cityName',
      },
    );
    List<CafeModel> cafes = data.map((e) => CafeModel.fromJson(e)).toList();
    return cafes;
  }
}
