class UserModel {
  String email;
  String token;
  DateTime expirationTime;

  UserModel({
    required this.email,
    required this.token,
    required this.expirationTime
  });

  UserModel copyWith({
    String? email,
    String? token,
    DateTime? expirationTime
  }) => UserModel(
    email: email ?? this.email, 
    token: token ?? this.token, 
    expirationTime: expirationTime ?? this.expirationTime
  );
}