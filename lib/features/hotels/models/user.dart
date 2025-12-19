class User {
  final int id;
  final String email;
  final String name;
  final String pass;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.pass
  });

  factory User.fromReqRes(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      pass: json['password']
    );
  }
}
