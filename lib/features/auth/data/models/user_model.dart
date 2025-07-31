import 'package:your_tour_guide/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
        id: data['id'],
        email: data['email'],
        name: data['name'],
        imageUrl: data['imageUrl'],
      );

  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      imageUrl: imageUrl,
    );
  }
}
