import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

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

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
      hostedDomain: 'teamdev.com');
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    var account = await _handleSignIn();

    if (account != null) {
      var token = await account.getIdToken().then((value) => value.token);

      print(token);
      var response = await http
          .get('https://days-off-manager-263921.ew.r.appspot.com/',
          headers:{
            'Authorization': 'Bearer ' + token,
            'Content-type': 'application/x-www-form-urlencoded; charset=utf-8',
            'Accept': 'text/json'
          });
      print(response.contentLength);

      setState(() {
        username = token;
        signedIn = true;
      });

    }
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  signOut() async {
    await _googleSignIn.signOut();
    setState(() {
      username = "";
      signedIn = false;
    });
  }
}
