import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'menu.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Days off manager")), body: AccountName());
  }
}

class AccountName extends StatelessWidget {

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
        'https://www.googleapis.com/auth/calendar'
      ],
      hostedDomain: 'teamdev.com'
  );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          RaisedButton(
            onPressed: () => doLogin(context),
            child: Text("Login with Google"),
          )
        ]));
  }

  doLogin(BuildContext context) async {
    var account = await _googleSignIn.signIn();

    if (account != null) {
      var token = await account.authentication.then((value) => value.accessToken);

      //todo: set state here

      Navigator.push(context, MaterialPageRoute(builder: (_) => MenuWidget()));
    }
  }
}
