class User {
  String userId;
  String username;
  String email;

  User(id) {
    userId = id;
  }

  String get getUserId => userId;

  set setUserId(String userId) => this.userId = userId;

  String get getUsername => username;

  set setUsername(String username) => this.username = username;

  String get getEmail => email;

  set setEmail(String email) => this.email = email;

  User.fromMap(Map<String, dynamic> data)
      : userId = data["userId"],
        email = data["email"];
  toMap() => <String, dynamic>{
        "userId": userId,
        "username": username,
        "email": email,
      };
}
