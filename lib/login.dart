import 'package:days_off_manager/store/actions.dart';
import 'package:days_off_manager/store/state.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redux/src/store.dart';

import 'menu.dart';

class LoginWidget extends StatelessWidget {
  final Store<ApplicationState> store;

  LoginWidget(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Days off manager")),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            onPressed: () => doLogin(context),
            child: Text("Login with Google"),
          )
        ])));
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://www.googleapis.com/auth/calendar'
  ], hostedDomain: 'teamdev.com');

  doLogin(BuildContext context) async {
    var account = await _googleSignIn.signIn();

    if (account != null) {
      var token =
          await account.authentication.then((value) => value.accessToken);

      store.dispatch(LoginAction(account: account, idToken: token));

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => MenuWidget(store)));
    }
  }
}
