import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';

import '../../models/topic.dart';

class TopicTable extends StatefulWidget {
  const TopicTable({Key? key, required this.topics}) : super(key: key);
  final List<Topic> topics;

  @override
  State<TopicTable> createState() => _TopicTableState();
}

class _TopicTableState extends State<TopicTable> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children:  [
            DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text('Nom du Topic'),
              ),
              DataColumn(
                label: Text('Date de Fin'),
              ),
              DataColumn(
                label: Text('Statut'),
              ),
            ],
            rows: List<DataRow>.generate(
              widget.topics.length,
              (int index) => DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return null; 
                }),
                cells: <DataCell>[
                  DataCell(Text('${widget.topics[index].name}')),
                  DataCell(Text('${widget.topics[index].dateEnded?.substring(0, 10)}')),
                  DataCell(
                    Text((() {
                      if(widget.topics[index].status == "2"){
                        return "Ouvert";
                      } else if(widget.topics[index].status == "1") {
                        return "en Attente";
                      } else {
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
