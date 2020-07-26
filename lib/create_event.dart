
import 'package:days_off_manager/event_type.dart';
import 'package:days_off_manager/store/state.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  EventType eventType;
  ApplicationState state;

  CreateEvent(this.eventType, this.state);


  @override
  State<StatefulWidget> createState() => CreateEventState();

}

class CreateEventState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Text("I will create calendar event!");
  }
}