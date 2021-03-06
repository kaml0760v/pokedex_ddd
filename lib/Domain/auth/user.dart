import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User implements _$User {
  const User._();
  const factory User({
    required String id,
    required String name,
    required String email,
    required String age,
    required String password,
  }) = _User;

  factory User.empty() => User(id: "", name: "", email: "", age: "",password: "");

  
}
