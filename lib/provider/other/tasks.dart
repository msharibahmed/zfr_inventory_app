import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TaskModel {
  final String id;
  final String text;
  final DateTime time;
  bool check;
  TaskModel(
      {@required this.id,
      @required this.text,
      @required this.time,
      this.check = false});
}

class TasksProv with ChangeNotifier {
  List<TaskModel> _tasks = [];
  final String token;
  TasksProv(this.token, this._tasks);

  List<TaskModel> get tasks {
    return [..._tasks];
  }

  Future<void> dialog(String text, BuildContext context) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Error Occured,' + text),
            content: Text('Check Your connection or contact developer.'),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('Okay!'),
              )
            ],
          );
        });
  }

  Future<void> checkChange(String id, BuildContext context) async {
    final url =
        'https://zfr-inventory.firebaseio.com/task/$id.json?auth=$token';
    var thatElement = _tasks.firstWhere((element) => element.id == id);

    try {
      thatElement.check = !thatElement.check;
      notifyListeners();

      final checkResponse = jsonDecode((await http.get(url)).body)['check'];

      await http.patch(url, body: jsonEncode({'check': !checkResponse}));
    } catch (error) {
      print(error);
      thatElement.check = !thatElement.check;
      await dialog('Couldn\'t perform the action!', context);
    }
    notifyListeners();
  }

  Future<void> addTask(String text, BuildContext context) async {
    final url = 'https://zfr-inventory.firebaseio.com/task.json?auth=$token';
    var date = DateTime.now();
    try {
      final response = await http.post(url,
          body: jsonEncode(
              {'text': text, 'time': date.toIso8601String(), 'check': false}));
      _tasks.add(TaskModel(
          id: jsonDecode(response.body)['name'], text: text, time: date));
    } catch (error) {
      print(error);
      await dialog('Couldn\'t add task!', context);
    }
    notifyListeners();
  }

  Future<void> fetch(BuildContext context) async {
    final url = 'https://zfr-inventory.firebaseio.com/task.json?auth=$token';
    try {
      final response =
          jsonDecode((await http.get(url)).body) as Map<String, dynamic>;
      // print(response);
      if (response == null) {
        return;
      } else {
        final List<TaskModel> temp = [];
        response.forEach((key, value) {
          temp.add(TaskModel(
              id: key,
              text: value['text'],
              time: DateTime.parse(value['time']),
              check: value['check']));
        });
        _tasks = temp;
        // print(_tasks);
        notifyListeners();
      }
    } catch (error) {
      // print(error);
      await dialog('Couldn\'t show all task!', context);
    }
  }

  int get checkedLength {
    var list = _tasks.where((element) => element.check == false);
    return list.length;
  }

  Future<void> dismissFunction(String id, BuildContext context) async {
    final url =
        'https://zfr-inventory.firebaseio.com/task/$id.json?auth=$token';

    try {
      await http.delete(url);
      // final response = await http.delete(url);
      // print(response.statusCode);
    } catch (error) {
      print(error);
      throw await showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text('Couldn\'t Delete!'),
              content: Text('Check Your connection or contact developer.'),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text('Okay!'),
                )
              ],
            );
          });
    }

    TaskModel itemToDelete = _tasks.firstWhere((element) => element.id == id);
    _tasks.remove(itemToDelete);
  }
}
