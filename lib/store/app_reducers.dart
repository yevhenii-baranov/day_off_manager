import 'package:days_off_manager/store/actions.dart';

String clientSecretReducer(String clientSecret, dynamic action) {
  if (action is LoginAction) {
    return action.clientSecret;
  }
  if (action is LogoutAction) {
    return null;
  }

  return clientSecret;
}

String emailReducer(String email, dynamic action) {
  if (action is LoginAction) {
    return action.email;
  }
  if (action is LogoutAction) {
    return null;
  }

  return email;
}

String firstNameReducer(String firstName, dynamic action) {
  if (action is LoginAction) {
    return action.firstName;
  }
  if (action is LogoutAction) {
    return null;
  }

  return firstName;
}

String lastNameReducer(String lastName, dynamic action) {
  if (action is LoginAction) {
    return action.lastName;
  }
  if (action is LogoutAction) {
    return null;
  }

  return lastName;
}

String photoUrlReducer(String photoUrl, dynamic action) {
  if (action is LoginAction) {
    return action.photoUrl;
  }
  if (action is LogoutAction) {
    return null;
  }

  return photoUrl;
}