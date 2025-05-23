import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.imageUrl});

  factory UserModel.fromFireBaseUser(User user) => UserModel(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        imageUrl: user.photoURL ??
            'https://ouurzampyyfbmhtgnvai.supabase.co/storage/v1/object/public/fruits-images/images/avatar.png',
      );

  factory UserModel.fromFireStore(Map<String, dynamic> data) => UserModel(
        id: data['id'],
        email: data['email'],
        name: data['name'],
        imageUrl: data['imageUrl'],
      );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        name: entity.name,
        email: entity.email,
        imageUrl: entity.imageUrl,
      );
  toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
    };
  }
}
