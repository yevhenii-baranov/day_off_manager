import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

@immutable
class ApplicationState {
  ApplicationState({@required this.account, @required this.idToken});

  final GoogleSignInAccount account;
  final String idToken;

  factory ApplicationState.initial() {
    return ApplicationState(account: null, idToken: null);
  }

  ApplicationState copyWith(GoogleSignInAccount account, String idToken) {
    return ApplicationState(
        account: account ?? this.account, idToken: idToken ?? this.idToken);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationState &&
          runtimeType == other.runtimeType &&
          account == other.account &&
          idToken == other.idToken;

  @override
  int get hashCode => account.hashCode ^ idToken.hashCode;
}