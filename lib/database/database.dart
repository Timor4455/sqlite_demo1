import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? db; // oje

  Future<Database> database() async {
    if (db != null) {
      return db!;
    } else {
      db = await _initDatabase();
      return db!;
    }
  }

  //find path
  Future<String> _getDatabasePath() async {
    var dbPath = await getDatabasesPath();

    return dbPath;
  }

  //create file
  Future<Database> _initDatabase() async {
    String path = join(await _getDatabasePath(), "student7.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
            CREATE TABLE "student" (
            	"id"	INTEGER,
              "firstname"	TEXT,
            	"lastname"	TEXT,
            	"dob"	TEXT,
            	"gender"	TEXT,
              "image"  Text,
              "class" TEXT,
            	PRIMARY KEY("id" AUTOINCREMENT)
            );
        ''');
      },
    );
  }

  //insert
  void insertStudent({required Map<String, dynamic> value}) async {
    var openDB = await database();
    openDB.insert(
      "student",
      value,
    );
  }

  //read
  Future<List<Map<String, dynamic>>> readStudent() async {
    var openDB = await database();

    var data = await openDB.query("student"); // query return list...

    debugPrint("Student : $data");
    return data;
  }
  //delete

  void DdeleteStudent(int deleteId) async {
    var openDB = await database();
    openDB.delete(
      "student",
      where: "id = ?",
      whereArgs: [deleteId],
    );
  }

  //update

  void updateStudent({required Map<String, dynamic> value}) async {
    var openDB = await database();
    openDB.update(
      "student",
      value,
      where: "id = ?",
      whereArgs: [value["id"]],
    );
  }
}

//c/dsd/stundent.db
