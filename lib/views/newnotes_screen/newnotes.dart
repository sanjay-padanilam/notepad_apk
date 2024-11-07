import 'package:flutter/material.dart';
import 'package:notepad_apk/controller/newnotes_Controller.dart';

import 'package:provider/provider.dart';

class Newnotes extends StatefulWidget {
  final String? title;
  final String? task;
  final int? appindex;

  final bool iseditornot;
  const Newnotes({
    super.key,
    required this.iseditornot,
    this.task,
    this.title,
    this.appindex,
  });

  @override
  State<Newnotes> createState() => _NewnotesState();
}

class _NewnotesState extends State<Newnotes> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController taskcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<NewnotesController>().initDb();
        await context.read<NewnotesController>().getTask();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.iseditornot) {
      titlecontroller.text = widget.title ?? "";
      taskcontroller.text = widget.task ?? "";
    }

    return Consumer<NewnotesController>(
        builder: (context, newnotesController, child) => Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.undo),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.redo),
                  onPressed: () {},
                ),
                IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await newnotesController.addTask(
                          titlecontroller.text, taskcontroller.text);

                      Navigator.pop(context);
                    }),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cursive',
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: titlecontroller,
                    maxLines: null,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Title...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: taskcontroller,
                    maxLines: null,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Start typing...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.text_format),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.check_circle_outline),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.alarm),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.image),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () async {
              await newnotesController.updatetask(
                  titlecontroller.text, taskcontroller.text, widget.appindex!);
            })));
  }
}
