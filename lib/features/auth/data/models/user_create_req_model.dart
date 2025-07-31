class UserCreateReqModel {
  final String name, email, password;
  String? imageUrl;

  UserCreateReqModel({
    required this.name,
    required this.email,
    required this.password,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "imageUrl": imageUrl,
    };
  }
}
