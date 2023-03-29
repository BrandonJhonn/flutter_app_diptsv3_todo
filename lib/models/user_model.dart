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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserModel obj;
    try {
      if (json.isEmpty) {
        obj = UserModel(
          email: "", 
          token: "", 
          expirationTime: DateTime.now()
        );
      } else {
        obj = UserModel(
          email: json['UserEmail'] ?? "", 
          token: json['TokenString'] ?? "", 
          expirationTime: DateTime.now()
        );
      }
    } catch (e) {
      rethrow;
    }
    return obj;
  }
}