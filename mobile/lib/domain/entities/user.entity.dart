class UserEntity {
  final String id;
  final String name;
  final String username;
  final String avatar;
  final String phone;
  final String email;
  final List<dynamic> friends;

  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.avatar,
    required this.phone,
    required this.email,
    required this.friends,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json['_id'] as String,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        avatar: json['avatar'] as String,
        phone: json['phone'] as String,
        friends: json['friends'] as List<dynamic>,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'username': username,
        'email': email,
        'avatar': avatar,
        'phone': phone,
        'friends': friends,
      };
}
