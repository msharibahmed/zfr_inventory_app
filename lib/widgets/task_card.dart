import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zfr_inventory_app/provider/other/tasks.dart';

import '../main_imports.dart';

class TaskCard extends StatelessWidget {
  final int index;
  TaskCard(this.index);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TasksProv>(context);

    return Dismissible(
      key: ValueKey(data.tasks[index].id),
       onDismissed: (direction) async {
        await data.dismissFunction(data.tasks[index].id,context);
        
        Scaffold.of(context).showSnackBar(SnackBar(
           
            elevation: 5,
            backgroundColor: Colors.blue[50],
            content: Text('Item Removed!',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))));
      },
      direction: DismissDirection.endToStart,
      background: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(Icons.delete, size: 30),
          ),
          alignment: Alignment.centerRight),
      child: Card(
        color: Colors.blue[50],
        elevation: 5,
        child: CheckboxListTile(
            title: Text(
              data.tasks[index].text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: data.tasks[index].check
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            value: data.tasks[index].check,
            subtitle: Text(
                DateFormat('dd MMM').format(data.tasks[index].time) +
                    ',' +
                    DateFormat('jm').format(data.tasks[index].time),
                style: TextStyle(
                  fontSize: 11,
                )),
            onChanged: (_) {
              data.checkChange(data.tasks[index].id, context);
            }),
      ),
    );
  }
}
