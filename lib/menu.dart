import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("And what happened today?"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(child: Text("Day off"), onPressed: dayOff(context)),
          RaisedButton(child: Text("Rest day"), onPressed: restDay(context)),
          RaisedButton(child: Text("ILL"), onPressed: ill(context)),
        ],
      )
    );
  }

  ill(BuildContext context) {
//    Navigator.push(context, MaterialPageRoute(builder: context => ))
  }

  dayOff(BuildContext context) {}

  restDay(BuildContext context) {}
}
