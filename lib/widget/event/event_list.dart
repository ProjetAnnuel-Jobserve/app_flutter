import 'package:flutter/material.dart';
import 'package:jobserve_ref/widget/event/event_table.dart';


import '../../models/event.dart';
import '../../services/event_service.dart';

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
            child: FutureBuilder(
              future: EventServices.getEvents(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: CircularProgressIndicator(),
                      ),
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
                          child: Text("Pas d'evenements"),
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
