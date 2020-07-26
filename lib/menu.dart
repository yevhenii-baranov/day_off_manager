import 'package:days_off_manager/event_type.dart';
import 'package:days_off_manager/store/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/src/store.dart';

import 'create_event.dart';

class MenuWidget extends StatelessWidget {
  final Store<ApplicationState>store;

  MenuWidget(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What happened today?"),
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
//    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEvent(EventType.ILL, store.state)));
  }

  dayOff(BuildContext context) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEvent(EventType.DAY_OFF, store.state)));
  }

  restDay(BuildContext context) {}
}
