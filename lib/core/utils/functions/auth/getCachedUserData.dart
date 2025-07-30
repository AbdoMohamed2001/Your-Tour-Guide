import 'dart:convert';

import '../../../../features/auth/data/models/user_model.dart';
import '../../../../features/auth/domain/entities/user_entity.dart';
import '../../../services/shared_prefs_services.dart';
import '../../constants.dart';

UserEntity getCachedUserData() {
  String userEntityEncoded = Prefs.getString(kUserData)!;
  var userModel = jsonDecode(userEntityEncoded);
  UserEntity userEntity = UserModel.fromFireStore(userModel);
  return userEntity;
}
