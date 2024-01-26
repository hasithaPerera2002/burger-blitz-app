class User {
  final String fname;
  final String lname;
  final String email;
  final String password;

  User({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fname: json['fname'],
      lname: json['lname'],
      email: json['email'],
      password: json['password'],
    );
  }
}
