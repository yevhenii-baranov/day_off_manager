import 'package:flutter/foundation.dart';

@immutable
class ApplicationState {

  ApplicationState({
    @required this.clientSecret,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.photoUrl
  });

  final String clientSecret;
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;

  factory ApplicationState.initial() {
    return ApplicationState(
        clientSecret: null,
        firstName: null,
        lastName: null,
        email: null,
        photoUrl: null);
  }

  ApplicationState copyWith(
      String clientSecret,
      String photoUrl,
      String email,
      String firstName,
      String lastName) {
    return ApplicationState(
        clientSecret: clientSecret ?? this.clientSecret,
        photoUrl: photoUrl ?? this.photoUrl,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationState &&
          runtimeType == other.runtimeType &&
          clientSecret == other.clientSecret &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          photoUrl == other.photoUrl;

  @override
  int get hashCode =>
      clientSecret.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      photoUrl.hashCode;
}