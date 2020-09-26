import '../main_imports.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final ctr = TextEditingController();

  // var _dependencyCheck = true;
  @override
  void dispose() {
    ctr.dispose();
    super.dispose();
  }

  // Future<void> fetch() async {
  //   // await Provider.of<TasksProv>(context, listen: false).fetch(context);
  // }

  var _boolcheck1 = true;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TasksProv>(context);
        final auth = Provider.of<Auth>(context,listen: false);



    return Scaffold(
        // backgroundColor: Colors.blue[50],

        body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     data.tasks.length==0? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.hot_tub,
                                  size: 100,
                                ),
                                Text(
                                    "Zero Tasks!"),
                                    
                              ],
                            ),
                          ): Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView.builder(
                            reverse: true,
                            itemBuilder: (context, index) => TaskCard(index),
                            itemCount: data.tasks.length,
                          ),
                        ),
                      ),
                   
                      if(auth.userId=='kknzmBDLNzVhZffDtibSBwuGvGe2')
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 2),
                              child: TextField(
                                cursorColor: Colors.deepOrange,
                                cursorRadius: Radius.circular(5.0),
                                cursorWidth: 2.0,
                                controller: ctr,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  fillColor: Colors.amber,
                                  hintText: 'Send Task',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  prefixIcon: Icon(Icons.assignment_turned_in),
                                ),
                              ),
                            ),
                          ),
                          _boolcheck1
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.send,
                                        size: 40,
                                      ),
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
                                      }),
                                )
                              : Image.asset(
                                  'assets/images/task.gif',
                                  height: 50,
                                  width: 50,
                                )
                        ],
                      )
                    ],
                  ));
  }
}
