import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class User {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String mobile;
  final String password;
  final String token;
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'mobile': mobile,
      'password': password,
      // 'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      password: map['password'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
