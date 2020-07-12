import 'package:days_off_manager/login.dart';
import 'package:days_off_manager/store/state.dart';
import 'package:days_off_manager/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


class MyApp extends StatelessWidget {
  final Store<ApplicationState> store = createStore();

  Widget build(BuildContext context) =>
      StoreProvider(store: this.store,
          child: MaterialApp(
            title: 'Days Off Manager',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginWidget(),
          ));
}

void main() {
  runApp(MyApp());
}
