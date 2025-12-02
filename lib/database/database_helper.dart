// import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   Database? db;

//   Future<Database> database() async {
//     if (db != null) {
//       return db!;
//     } else {
//       db = await _initDatabase();
//       return db!;
//     }
//   }

//   //found path
//   Future<String> _getDatabasePath() async {
//     var dbpath = await _getDatabasePath();

//     return dbpath;
//   }

//   // create file
//   Future<Database> _initDatabase() async {
//     String path = join(await _getDatabasePath(), "student.db");

//     return openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) {
//         db.execute('''
//           CREATE TABLE "student" (
//  "id" INTEGER,
//  "name" TEXT,
//  "dob" TEXT,
//  "point" REAL,
//  PRIMARY KEY("id" AUTOINCREMENT)
// );
//         ''');
//       },
//     );
//   }

//   // insert
//   void insertStudent() async {
//     var openDB = await database();
//     openDB.insert(
//       "student",
//       {
//         "name": "Davide",
//         "dob": "18-11-25",
//         "point": 100,
//       },
//     );
//   }

//   // insert
//   void readStudent() async {
//     var openDB = await database();

//     var data = await openDB.query("student");
//     debugPrint("Read data : $data");
//   }
// }
