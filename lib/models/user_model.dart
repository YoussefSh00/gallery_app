class User {
  final int id;
  final String name;
  final String email;
  final String emailVerifiedAt;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.emailVerifiedAt});

  factory User.fromJson(json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
    );
  }
}
