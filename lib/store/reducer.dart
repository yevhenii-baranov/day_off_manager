import 'package:days_off_manager/store/state.dart';

import 'app_reducers.dart';

//todo: Look up more advanced reducer technique
ApplicationState reducer(ApplicationState state, dynamic action) {
  return new ApplicationState(
      account: accountReducer(state.account, action),
      idToken: idTokenReducer(state.idToken, action));
}