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

  final GoogleSignIn signIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);

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
          Text(username == "" ? "" : "Hello, $username")
        ]));
  }

  doLogin() async {
    var account = await signIn.signIn();

    if (account != null) {
      setState(() {
        username = account.displayName;
        signedIn = true;
      });
    }
  }

  signOut() async {
    await signIn.signOut();
    setState(() {
      username = "";
      signedIn = false;
    });
  }
}
