import 'package:flutter/material.dart';
import 'package:sqlite_demo/route/app_route.dart';
import 'package:sqlite_demo/route/page_route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Approutes.homescreen,
      routes: PageRoutes.pageRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
