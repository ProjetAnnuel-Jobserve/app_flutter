import 'package:flutter/material.dart';
import 'package:jobserve_ref/widget/event/event_list.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EventList();
  }
}