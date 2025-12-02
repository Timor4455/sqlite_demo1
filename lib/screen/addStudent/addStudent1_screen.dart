import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pp;
import 'package:sqlite_demo/database/database.dart';

class Addstudent1Screen1_Ex extends StatefulWidget {
  const Addstudent1Screen1_Ex({super.key});

  @override
  State<Addstudent1Screen1_Ex> createState() => _Addstudent1Screen1_ExState();
}
// not create modalrount in build ciause it have setSta

class _Addstudent1Screen1_ExState extends State<Addstudent1Screen1_Ex> {
  var fnCtrl = TextEditingController();
  var lnCtrl = TextEditingController();
  var emCtrl = TextEditingController();
  var pnCtrl = TextEditingController();

  String gender = "Male";
  String dob = "";
  String image = "";
  int id = 0;
  String classId = "";

  var studentData = {};

  void SelectOB() async {
    var date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        dob = "${date.day},${date.month},${date.year},";
      });
    }
  }

  @override
  void didChangeDependencies() {
    // use caouse have can use ciuase it have context and setStated but initstat can't
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var uData = (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;

    setState(() {
      studentData = uData;
    });

    if (studentData.isNotEmpty) {
      fnCtrl.text = studentData["firstname"];
      lnCtrl.text = studentData["lastname"];
      dob = studentData["dob"];
      gender = studentData["gender"];
      image = studentData["image"];
      id = studentData["id"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xffcebbf2),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                true); // true  use for if have data it will pop to homescreen
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          studentData.isEmpty ? "Add Student" : "Update Student",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    var pickImage = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickImage != null) {
                      final directory =
                          await pp.getApplicationDocumentsDirectory();
                      final fileName = p.basename(pickImage.path);
                      final savedImage = await File(pickImage.path)
                          .copy('${directory.path}/$fileName');
                      setState(() {
                        image = savedImage.path;
                      });
                    }

                    // only gallary use pick medea
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 236, 230, 247),
                      border: Border.all(
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Image.file(
                      fit: BoxFit.cover,
                      File(image),
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person_2_outlined,
                          size: 50,
                          color: const Color.fromARGB(177, 0, 0, 0),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildPersonal(),
              SizedBox(
                height: 20,
              ),
              buildContact(),
              SizedBox(
                height: 20,
              ),
              buildAcademic(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPersonal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personal Informations",
          style: GoogleFonts.spaceGrotesk(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: buildTextFeild(
                hintText: "First Name",
                controler: fnCtrl,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: buildTextFeild(
                hintText: "Last Name",
                controler: lnCtrl,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            SelectOB();
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(169, 0, 0, 0),
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16),
            child: Text(
              dob.isEmpty ? "Select Date of Birth" : "Select Date : $dob",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(169, 0, 0, 0),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Radio<String>(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (Value) {
                        setState(() {
                          gender = Value!;
                        });
                      },
                    ),
                    Text(
                      "Male",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(169, 0, 0, 0),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Radio<String>(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (Value) {
                        setState(() {
                          gender = Value!;
                        });
                      },
                    ),
                    Text(
                      "Female",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Informations",
          style: GoogleFonts.spaceGrotesk(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        buildTextFeild(
          hintText: "Email Address",
          controler: emCtrl,
        ),
        SizedBox(
          height: 10,
        ),
        buildTextFeild(
          hintText: "Phone Number",
          controler: pnCtrl,
        ),
      ],
    );
  }

  Widget buildAcademic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Academic Informations",
          style: GoogleFonts.spaceGrotesk(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        PopupMenuButton<String>(
          position: PopupMenuPosition.under,
          // offset: Offset.fromDirection(BorderSide.strokeAlignOutside),
          onSelected: (value) {
            setState(() {
              classId = value;
            });
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: "A1",
                child: Text(
                  "Class : A1",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              PopupMenuItem(
                value: "B1",
                child: Text(
                  "Class : B1",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ];
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(169, 0, 0, 0),
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16),
            child: Text(
              classId.isEmpty
                  ? "Sellect Classes"
                  : "Sellect Classes : $classId",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 2,
              color: const Color.fromARGB(169, 0, 0, 0),
            ),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 16),
          child: Text(
            "Enroll Date",
            style: GoogleFonts.spaceGrotesk(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 45,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (studentData.isEmpty) {
                    DatabaseHelper().insertStudent(
                      value: {
                        "firstname": fnCtrl.text,
                        "lastname": lnCtrl.text,
                        "dob": dob,
                        "gender": gender,
                        "image": image,
                        "class": classId,
                      },
                    );

                    setState(
                      () {
                        fnCtrl.clear();
                        lnCtrl.clear();
                        dob = "";
                        gender = "";
                        image = "";
                        classId = "";
                      },
                    );
                  } else {
                    DatabaseHelper().updateStudent(
                      value: {
                        "id": id,
                        "firstname": fnCtrl.text,
                        "lastname": lnCtrl.text,
                        "dob": dob,
                        "gender": gender,
                        "image": image,
                        "class": classId,
                      },
                    );

                    setState(
                      () {
                        fnCtrl.clear();
                        lnCtrl.clear();
                        dob = "";
                        gender = "";
                        image = "";
                        classId = "";
                      },
                    );
                    Navigator.pop(context, true);
                  }
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xffcebbf2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      studentData.isEmpty ? "Add Student" : "Update Student",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildTextFeild(
      {required String hintText, TextEditingController? controler}) {
    return TextField(
      controller: controler,
      style: GoogleFonts.spaceGrotesk(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.spaceGrotesk(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.only(
          top: 16,
          left: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: const Color.fromARGB(169, 0, 0, 0),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
