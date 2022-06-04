import 'package:mobile/domain/entities/user.entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.avatar,
    required super.phone,
    required super.friends,
  });

  @override
  String toString() {
    return 'UserModel(name: $name, username: $username, email: $email, avatar: $avatar, phone: $phone, friends: $friends)';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String,
        phone: json['phone'] as String,
        friends: json['friends'] as List<String>,
      );
}
