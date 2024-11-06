// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';

// class HomescreenConteroller with ChangeNotifier {
//   late Database myDatabase;
//   List<Map> employeeDataList = [];

//   //----------------------------------------------------------

//   Future initDb() async {
//     // open the database
//     myDatabase = await openDatabase("notesdb.db", version: 1,
//         onCreate: (Database db, int version) async {
//       // When creating the db, create the table
//       await db.execute(
//           'CREATE TABLE Notestable (id INTEGER PRIMARY KEY, title TEXT, task TEXT)');
//     });
//   }
//   //----------------------------------------------------------

//   Future addTask({required String title, required String task}) async {
//     await myDatabase.rawInsert(
//         'INSERT INTO Notestable(title, task) VALUES(?, ?)', [title, task]);

//     getTask();
//   }
//   //----------------------------------------------------------

//   Future getTask() async {
//     // Get the records
//     employeeDataList = await myDatabase.rawQuery('SELECT * FROM Employees');
//     print(employeeDataList);
//   }

//   Future removeTask(int id) async {
//     await myDatabase.rawDelete('DELETE FROM Employees WHERE id = ?', [id]);
//     getTask();
//   }

//   editTask() {}
// }
