import 'dart:convert';

import 'package:your_tour_guide/core/utils/constants.dart';

import '../../../features/auth/data/models/user_model.dart';
import '../../services/shared_prefs_services.dart';

UserModel getUserData() {
  final userJson = Prefs.getString(kCachedUserData);
  return UserModel.fromJson(jsonDecode(userJson!));
}
