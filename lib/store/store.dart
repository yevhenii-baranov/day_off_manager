import 'package:days_off_manager/store/reducer.dart';
import 'package:days_off_manager/store/state.dart';
import 'package:redux/redux.dart';

Store<ApplicationState> createStore() {
  return Store(
    reducer,
    initialState: ApplicationState.initial()
  );
}
