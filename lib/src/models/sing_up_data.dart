import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class SignUpData {
  final String name;
  final String password;
  final String verificationCode;

  SignUpData({
    @required this.name,
    @required this.password,
    @required this.verificationCode,
  });

  @override
  String toString() {
    return '$runtimeType($name, $password)';
  }

  bool operator ==(Object other) {
    if (other is SignUpData) {
      return name == other.name && password == other.password;
    }
    return false;
  }

  int get hashCode => hash2(name, password);
}
