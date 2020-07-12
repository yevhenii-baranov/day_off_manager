import 'package:flutter/foundation.dart';

@immutable
class LoginAction {

  LoginAction({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.photoUrl,
    @required this.clientSecret
});

  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;
  final String clientSecret;
}

class LogoutAction {

}