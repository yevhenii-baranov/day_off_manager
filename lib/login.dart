import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Days off manager")), body: AccountName());
  }
}

class AccountName extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountNameState();
}

class _AccountNameState extends State<AccountName> {
  String username = "";
  bool signedIn = false;
  String accessToken = "";

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
            onPressed: () => doLogin(),
            child: Text("Login with Google"),
          ),
          signedIn
              ? RaisedButton(
                  child: Text("Log out"),
                  onPressed: () => signOut(),
                )
              : Container(),
          Text(username == "" ? "" : "Hello, $username"),
          Text(accessToken == "" ? "" : "token: $accessToken")
        ]));
  }

  doLogin() async {
    var account = await _googleSignIn.signIn();


    if (account != null) {
      var token = await account.authentication.then((value) => value.accessToken);

      setState(() {
        username = account.email;
        accessToken = token;
        signedIn = true;
      });

    }
  }

  signOut() async {
    await _googleSignIn.signOut();
    setState(() {
      username = "";
      signedIn = false;
    });
  }
}
