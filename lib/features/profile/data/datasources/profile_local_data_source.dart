import 'dart:convert';

import '../../../../core/services/shared_prefs_services.dart';

abstract class ProfileLocalDataSource {
  Future<void> updateCachedData({
    required String key,
    required String fieldName,
    required String fieldValue,
  });
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<void> updateCachedData({
    required String key,
    required String fieldName,
    required String fieldValue,
  }) async {
    String? cachedData = Prefs.getString(key);
    if (cachedData != null) {
      Map<String, dynamic> dataMap =
          jsonDecode(cachedData) as Map<String, dynamic>;
      Map<String, dynamic> updatedCachedData = {...dataMap};
      updatedCachedData[fieldName] = fieldValue;
      var updatedDataEncoded = jsonEncode(updatedCachedData);
      await Prefs.setString(key, updatedDataEncoded);
    }
  }
}
