import 'package:flutter/material.dart';
import 'package:sqlite_demo/screen/classScreen/classscreen.dart';
import 'package:sqlite_demo/route/app_route.dart';
import 'package:sqlite_demo/screen/addStudent/addStudent1_screen.dart';
import 'package:sqlite_demo/screen/addStudent/addStudent_screen.dart';
import 'package:sqlite_demo/screen/sqlite/sqlite_Ex.dart';

class PageRoutes {
  // ignore: non_constant_identifier_names
  static Map<String, Widget Function(BuildContext)> pageRoute = {
    Approutes.homescreen: (context) => SqliteEx(),
    Approutes.addStudent: (context) => AddstudentScreen_Ex(),
    Approutes.addStudent1: (context) => Addstudent1Screen1_Ex(),
    Approutes.classscreen: (context) => Classscreen(),
  };
}
