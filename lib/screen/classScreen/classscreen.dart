import 'package:flutter/material.dart';
import 'package:sqlite_demo/database/database.dart';

class Classscreen extends StatefulWidget {
  const Classscreen({super.key});

  @override
  State<Classscreen> createState() => _ClassscreenState();
}

class _ClassscreenState extends State<Classscreen> {
  List<Map<String, dynamic>> studentData = [];

  // TabController? tabCtrl;
  // var activeIndex = 0;
  // var filter = student ;

  void loadData() async {
    var data = await DatabaseHelper().readStudent();
    setState(() {
      studentData = data
          .where(
            (data) => classCode == data["class"],
          )
          .toList();
    });
  }

  String classCode = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    var data = ModalRoute.of(context)!.settings.arguments as String;

    setState(() {
      classCode = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class : $classCode"),
      ),
    );
  }
}
