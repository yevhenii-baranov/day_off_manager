import 'package:days_off_manager/store/state.dart';

import 'app_reducers.dart';

ApplicationState reducer(ApplicationState state, dynamic action) {
  return new ApplicationState(
      clientSecret: clientSecretReducer(state.clientSecret, action),
      email: emailReducer(state.email, action),
      firstName: firstNameReducer(state.firstName, action),
      lastName: lastNameReducer(state.lastName, action),
      photoUrl: photoUrlReducer(state.photoUrl, action));
}