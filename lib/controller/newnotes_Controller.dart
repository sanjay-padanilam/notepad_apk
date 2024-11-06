import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NewnotesController with ChangeNotifier {
  late Database myDatabase;
  List<Map> tasksList = [];

  //----------------------------------------------------------

  Future initDb() async {
    // Open the database
    myDatabase = await openDatabase("notesdb.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Notestable (id INTEGER PRIMARY KEY, title TEXT, task TEXT)');
    });
  }

  //----------------------------------------------------------

  Future addTask({required String title, required String task}) async {
    await myDatabase.rawInsert(
        'INSERT INTO Notestable(title, task) VALUES(?, ?)', [title, task]);
    getTask();
  }

  //----------------------------------------------------------

  Future getTask() async {
    // Get the records
    tasksList = await myDatabase.rawQuery('SELECT * FROM Notestable');
    log(tasksList.toString());
    notifyListeners();
  }

  //----------------------------------------------------------

  Future removeTask(int id) async {
    await myDatabase.rawDelete('DELETE FROM Notestable WHERE id = ?', [id]);
    getTask();
  }

  //----------------------------------------------------------

  Future editTask(
      {required int id, required String title, required String task}) async {
    await myDatabase.rawUpdate(
        'UPDATE Notestable SET title = ?, task = ? WHERE id = ?',
        [title, task, id]);
    getTask();
  }

  //----------------------------------------------------------

  Future closeDb() async {}
}
