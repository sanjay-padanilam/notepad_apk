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
    return Scaffold(
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
          itemBuilder: (context, index) => NoteCard(
                title: context.watch<NewnotesController>().tasksList[index]
                    ["title"],
                subtitle: context.watch<NewnotesController>().tasksList[index]
                    ["task"],
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: context.watch<NewnotesController>().tasksList.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Newnotes(),
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
    );
  }
}
