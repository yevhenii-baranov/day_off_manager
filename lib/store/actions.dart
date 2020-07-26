import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

@immutable
class LoginAction {

  LoginAction({
    @required this.account,
    @required this.idToken
  });

  final GoogleSignInAccount account;
  final String idToken;
}

class LogoutAction {

}