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

    return Card(
      elevation: 5,
      child: CheckboxListTile(
          title: Text(
            data.tasks[index].text,
            style: TextStyle(fontWeight: FontWeight.bold,
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
            data.checkChange(data.tasks[index].id,context);
          }),
    );
  }
}
