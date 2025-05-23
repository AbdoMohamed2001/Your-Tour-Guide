import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class DatabaseServices {
  Future<void> addUser({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });

  Future<Either<Failure, void>> addReview({
    required String path,
    required String recordId,
    required Map<String, dynamic> review,
  });

  Future<Either<Failure, void>> addData({
    required String path,
    String? recordId,
    String? subPath,
    String? subRecordId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, void>> removeData({
    required String path,
    String? recordId,
    String? subPath,
    String? subRecordId,
  });

  Future<dynamic> getData({
    required String path,
    String? recordId,
    Map<String, dynamic>? query,
    String? subPath,
    String? subRecordId,
  });

  Future<void> updateData({
    required String path,
    required String recordId,
    required String fieldName,
    required dynamic fieldData,
  });

  Future<List<Map<String, dynamic>>> searchData({
    required String path,
    required String searchField,
    required String query,
  });
}
