import '../main_imports.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final ctr = TextEditingController();

  @override
  void dispose() {
    ctr.dispose();
    super.dispose();
  }

  var _boolcheck1 = true;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TasksProv>(context);
    final auth = Provider.of<Auth>(context, listen: false);

    return Scaffold(
      floatingActionButton: auth.email != null
          ? FloatingActionButton.extended(
              icon: Icon(Icons.add),
              elevation: 5,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Row(children: [
                      const Icon(
                        Icons.assignment_turned_in,
                        size: 40,
                      ),
                      Text(
                        'Add New Task',
                        style: const TextStyle(fontSize: 15),
                      )
                    ]),
                    content: Container(
                      height: 150,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 2),
                            child: TextField(
                              cursorColor: Colors.deepOrange,
                              cursorRadius: Radius.circular(5.0),
                              cursorWidth: 2.0,
                              controller: ctr,
                              textCapitalization: TextCapitalization.sentences,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                fillColor: Colors.amber,
                                hintText: 'Send Task',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          _boolcheck1
                              ? TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10)),
                                    primary: Colors.black,
                                  ),
                                  child: const Text('ADD TASK',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  onPressed: () async {
                                    if (ctr.text.isNotEmpty) {
                                      setState(() {
                                        _boolcheck1 = false;
                                      });
                                      await data
                                          .addTask(ctr.text, context)
                                          .then((_) {
                                        setState(() {
                                          _boolcheck1 = true;
                                        });
                                      });
                                      ctr.clear();
                                    } else {
                                      FocusScope.of(context).unfocus();
                                      return;
                                    }
                                    FocusScope.of(context).unfocus();
                                  })
                              : Image.asset(
                                  'assets/images/task.gif',
                                  height: 50,
                                  width: 50,
                                )
                        ],
                      ),
                    ),
                  ),
                );
              },
              label: Text('Add Task'))
          : null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: data.tasks.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.hot_tub,
                    size: 100,
                  ),
                  const Text("Zero Tasks!"),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                reverse: true,
                itemBuilder: (context, index) => TaskCard(index),
                itemCount: data.tasks.length,
              ),
            ),
    );
  }
}
