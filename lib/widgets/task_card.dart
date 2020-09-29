import 'package:intl/intl.dart';
import '../main_imports.dart';

class TaskCard extends StatelessWidget {
  final int index;
  TaskCard(this.index);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TasksProv>(context);
    final auth = Provider.of<Auth>(context, listen: false);

    return auth.email != null
        ? Dismissible(
            key: ValueKey(data.tasks[index].id),
            onDismissed: (direction) async {
              await data.dismissFunction(data.tasks[index].id, context);

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
                  child:const Icon(Icons.delete, size: 30),
                ),
                alignment: Alignment.centerRight),
            child: TaskCard1(data: data, index: index),
          )
        : TaskCard1(data: data, index: index);
  }
}

class TaskCard1 extends StatelessWidget {
  const TaskCard1({
    Key key,
    @required this.data,
    @required this.index,
  }) : super(key: key);

  final TasksProv data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              style: const TextStyle(
                fontSize: 11,
              )),
          onChanged: (_) {
            if (Provider.of<Auth>(context, listen: false).email != null) {
              data.checkChange(data.tasks[index].id, context);
            }
          }),
    );
  }
}
