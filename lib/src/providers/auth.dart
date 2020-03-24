import 'package:flutter/material.dart';
import '../models/sing_up_data.dart';

import '../models/login_data.dart';

enum AuthMode { Signup, Login }

/// The result is an error message, callback successes if message is null
typedef AuthCallback = Future<String> Function(LoginData);

typedef SignUpDataCallback = Future<String> Function(SignUpData);

/// The result is an error message, callback successes if message is null
typedef RecoverCallback = Future<String> Function(String);

typedef SendCodeCallback = Future<String> Function(LoginData);

class Auth with ChangeNotifier {

  Auth({
    this.onLogin,
    this.onSignup,
    this.onRecoverPassword,
    this.onSendCode,
    String email = '',
    String password = '',
    String confirmPassword = '',
    String verificationCode = '',
  })  : this._email = email,
        this._password = password,
        this._confirmPassword = confirmPassword,
        this._verificationCode = verificationCode;

  final AuthCallback onLogin;
  final SignUpDataCallback onSignup;
  final RecoverCallback onRecoverPassword;
  final SendCodeCallback onSendCode;


  AuthMode _mode = AuthMode.Login;

  AuthMode get mode => _mode;
  set mode(AuthMode value) {
    _mode = value;
    notifyListeners();
  }

  bool get isLogin => _mode == AuthMode.Login;
  bool get isSignup => _mode == AuthMode.Signup;
  bool isRecover = false;

  AuthMode opposite() {
    return _mode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
  }

  AuthMode switchAuth() {
    if (mode == AuthMode.Login) {
      mode = AuthMode.Signup;
    } else if (mode == AuthMode.Signup) {
      mode = AuthMode.Login;
    }
    return mode;
  }

  String _email = '';
  get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassword = '';
  get confirmPassword => _confirmPassword;
  set confirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }

  String _verificationCode = '';
  get verificationCode => _verificationCode;
  set verificationCode (String verificationCode){
    _verificationCode = verificationCode;
    notifyListeners();
  }

}
