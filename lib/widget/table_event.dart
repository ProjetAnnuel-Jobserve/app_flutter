import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';

import '../models/event.dart';

class EventTable extends StatefulWidget {
  const EventTable({Key? key, required this.events}) : super(key: key);
  final List<Event> events;

  @override
  State<EventTable> createState() => _EventTableState();
}

class _EventTableState extends State<EventTable> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('DateInscription'),
          ),
          DataColumn(
            label: Text('DateEnded'),
          ),
          DataColumn(
            label: Text('Statut'),
          ),
          DataColumn(
            label: Text('Modifier'),
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
              DataCell(Text('${widget.events[index].dateInscription}')),
              DataCell(Text('${widget.events[index].dateEnded}')),
              DataCell(
                Text((() {
                  if(widget.events[index].status == "2"){
                    return "Ouvert";
                  }else {
                    return "Fermée";
                  }
                })())),
              DataCell(
                ElevatedButton(
                  child: Icon(Icons.create_rounded),
                  onPressed: () {
                  
                  },
                  style: ElevatedButton.styleFrom(
                    primary: jSecondaryColor
                  ),
                ),
              ),
              ],
            selected: selected[index],
            onSelectChanged: (bool? value) {
              setState(() {
                selected[index] = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
