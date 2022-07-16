import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/topic.dart';
import 'package:jobserve_ref/services/topic_service.dart';
import 'package:jobserve_ref/widget/topic/topic_table.dart';



class TopicList extends StatelessWidget {
  const TopicList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: FutureBuilder(
              future: TopicServices.getTopics(),
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
                      final List<Topic> topics = snapshot.data;
                      if (topics.isEmpty) {
                        return Center(
                          child: Text("Pas de topics"),
                        );
                      }
                      return TopicTable(topics: topics);
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
