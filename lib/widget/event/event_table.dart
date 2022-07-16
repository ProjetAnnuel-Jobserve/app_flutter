import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';

import '../../models/event.dart';

class EventTable extends StatefulWidget {
  const EventTable({Key? key, required this.events}) : super(key: key);
  final List<Event> events;

  @override
  State<EventTable> createState() => _EventTableState();
}

class _EventTableState extends State<EventTable> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Nom de l\'Evenement'),
            ),
            DataColumn(
              label: Text('Date de fin d\'Inscription'),
            ),
            DataColumn(
              label: Text('Date de l\'Evenement'),
            ),
            DataColumn(
              label: Text('Statut'),
            ),
          ],
          rows: List<DataRow>.generate(
            widget.events.length,
            (int index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
               
                return null; 
              }),
              cells: <DataCell>[
                DataCell(Text('${widget.events[index].name}')),
                DataCell(Text('${widget.events[index].dateInscription?.substring(0, 10)}')),
                DataCell(Text('${widget.events[index].dateEnded?.substring(0, 10)}')),
                DataCell(
                  Text((() {
                    if(widget.events[index].status == "2"){
                      return "Ouvert";
                    }else {
                      return "Fermée";
                    }
                  })())),
                ],
            ),
          ),
        ),
      ]
      ),
    );
  }
}
