import 'package:flutter/material.dart';
import 'package:jobserve_ref/widget/table_event.dart';


import '../models/event.dart';
import '../services/event_service.dart';

class EventList extends StatelessWidget {
  const EventList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: OutlinedButton(
                child: Text("Supprimer"),
                onPressed: () {

                },),
            ),),
          Container(
            child: FutureBuilder(
              future: EventServices.getEvents(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error} ici"),
                      );
                    }
                    if (snapshot.hasData) {
                      final List<Event> events = snapshot.data;
                      if (events.isEmpty) {
                        return Center(
                          child: Text("Empty list"),
                        );
                      }
                      return EventTable(events: events);
                    } else {
                      return Center(
                        child: Text("No data"),
                      );
                    }
                  default:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
