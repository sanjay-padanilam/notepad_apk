import 'package:flutter/material.dart';

import 'package:notepad_apk/controller/newnotes_Controller.dart';
import 'package:notepad_apk/views/homescreen/widgets/notecard.dart';

import 'package:notepad_apk/views/newnotes_screen/newnotes.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<NewnotesController>().initDb();
        await context.read<NewnotesController>().getTask();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewnotesController>(
      builder: (context, newnotesController1, child) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Notes',
              style: TextStyle(
                  fontSize: 36, fontFamily: 'Cursive', color: Colors.white)),
          elevation: 0,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(Icons.check_box),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => InkWell(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("cancel")),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              await newnotesController1.removetask(
                                  newnotesController1.taskLists[index]["id"]);
                              Navigator.pop(context);
                            },
                            child: Text("delete")),
                      )
                    ],
                  ),
                ),
              );
            },
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Newnotes(
                      appindex: newnotesController1.taskLists[index]["id"],
                      iseditornot: true,
                      task: newnotesController1.taskLists[index]["task"],
                      title: newnotesController1.taskLists[index]["title"],
                    ),
                  ));
            },
            child: NoteCard(
              title: newnotesController1.taskLists[index]["title"],
              subtitle: newnotesController1.taskLists[index]["task"],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: newnotesController1.taskLists.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Newnotes(
                    iseditornot: false,
                  ),
                ));
          },
          backgroundColor: Colors.amber,
          child: Icon(Icons.add, color: Colors.black),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Folder',
            ),
          ],
        ),
      ),
    );
  }
}
