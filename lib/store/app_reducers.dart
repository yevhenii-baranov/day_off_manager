import 'package:days_off_manager/store/actions.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignInAccount accountReducer(GoogleSignInAccount account, dynamic action) {
  if (action is LoginAction) {
    return action.account;
  }
  if (action is LogoutAction) {
    return null;
  }

  return account;
}

String idTokenReducer(String idToken, dynamic action) {
  if (action is LoginAction) {
    return action.idToken;
  }
  if (action is LogoutAction) {
    return null;
  }

  return idToken;
}
