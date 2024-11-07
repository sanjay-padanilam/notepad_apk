import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NewnotesController with ChangeNotifier {
  late Database myDatabase;
  List<Map> taskLists = [];

  //---------------------------------------------------------
  Future initDb() async {
    // open the database
    myDatabase = await openDatabase('Taskpathdb.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Notestable (id INTEGER PRIMARY KEY, title TEXT, task TEXT)');
    });
  }

//---------------------------------------------------------
  Future addTask(String title, String task) async {
    await myDatabase.rawInsert(
        'INSERT INTO Notestable(title, task) VALUES(?,?)', [title, task]);
    getTask();
    notifyListeners();
  }

  Future getTask() async {
    taskLists = await myDatabase.rawQuery('SELECT * FROM Notestable');
    print(taskLists);
    notifyListeners();
  }

  Future removetask(int id) async {
    await myDatabase.rawDelete('DELETE FROM Notestable WHERE id = ?', [id]);
    getTask();
  }

  Future updatetask(String newtitle, String newtask, int id) async {
    await myDatabase.rawUpdate(
        'UPDATE Notestable SET title = ?, task = ? WHERE id = ?',
        [newtitle, newtask, id]);
    getTask();
  }
}
