import 'dart:convert';
import '../../../../../core/services/shared_prefs_services.dart';
import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> deleteUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String userKey = 'CACHED_USER';

  AuthLocalDataSourceImpl();

  @override
  Future<void> saveUser(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    await Prefs.setString(userKey, userJson);
  }

  @override
  Future<UserModel?> getUser() async {
    final userJson = Prefs.getString(userKey);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  @override
  Future<void> deleteUser() async {
    await Prefs.delete(userKey);
  }
}
