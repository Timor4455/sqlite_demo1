import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqlite_demo/database/database.dart';
import 'package:sqlite_demo/route/app_route.dart';

class SqliteEx extends StatefulWidget {
  const SqliteEx({super.key});

  @override
  State<SqliteEx> createState() => _SqliteExState();
}

class _SqliteExState extends State<SqliteEx> {
  List<Map<String, dynamic>> studentData = [];

  // TabController? tabCtrl;
  // var activeIndex = 0;
  // var filter = student ;

  void loadData() async {
    var data = await DatabaseHelper().readStudent();
    setState(() {
      studentData = data;
    });
  }

  @override
  void initState() {
    // show data after build
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildGreeting(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Classses",
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  // Expanded(
                  //   child: TabBarView(
                  //     controller: tabCtrl,
                  //     children: [
                  //       buildChat("C/Cpp"),
                  //       buildChat("C-shape"),
                  //       buildChat("Flutter"),
                  //     ],
                  //   ),
                  // ),
                  Text(
                    "All Student ",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),

                  buildStudentList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Approutes.classscreen,
                arguments: "A1",
              );
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/photo_2025-11-27_16-08-57.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Class : 1A ",
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                        // color: Colors.white,
                      ),
                    ),
                    Text(
                      "Programming ",
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1,
                        // color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_outward,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Approutes.classscreen,
                arguments: "B1",
              );
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/photo_2025-11-27_16-08-57.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Class : 1B",
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold, fontSize: 18,
                        // color: Colors.white,
                      ),
                    ),
                    Text(
                      "Web Design",
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold, fontSize: 16, height: 1,
                        // color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_outward,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGreeting() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 196, 168, 243),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    var ispop = await Navigator.pushNamed(
                      context,
                      Approutes.addStudent1,
                    );

                    if (ispop != null) {
                      loadData();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add Student",
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FittedBox(
                // fittedbox use for responsive not need fontsize couse
                child: Text(
                  "good\nmorming!".toUpperCase(),
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 0.9,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildChat(String category) {
  //   var filterData = studentData.where(
  //     (element) {
  //       return element["category"].toLowerCase() == category.toLowerCase();
  //     },
  //   ).toList();
  //   return filterData.isEmpty
  //       ? Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Icon(
  //                 Icons.info_rounded,
  //                 color: Colors.white,
  //                 size: 50,
  //               ),
  //               Text(
  //                 "No Data",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       : ListView.separated(
  //           separatorBuilder: (context, index) {
  //             return SizedBox(
  //               height: 20,
  //             );
  //           },
  //           itemBuilder: (context, index) {
  //             return Row(
  //               children: [
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(40),
  //                   child: Image.network(
  //                     filterData[index]['profileImage'],
  //                     width: 60,
  //                     height: 60,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 20,
  //                 ),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         filterData[index]["userName"],
  //                         style: GoogleFonts.spaceGrotesk(
  //                           color: Colors.white,
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                       ),
  //                       // SizedBox(
  //                       //   height: 10,
  //                       // ),
  //                       Text(
  //                         filterData[index]["message"],
  //                         style: GoogleFonts.spaceGrotesk(
  //                           color: filterData[index]["isRead"]
  //                               ? Colors.grey
  //                               : Colors.white,
  //                           fontSize: 14,
  //                           fontWeight: filterData[index]["isRead"]
  //                               ? FontWeight.w400
  //                               : FontWeight.w600,
  //                         ),
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 50,
  //                 ),
  //                 Text(
  //                   filterData[index]["timestamp"],
  //                   style: GoogleFonts.spaceGrotesk(
  //                     color: Colors.white,
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.w400,
  //                   ),
  //                 ),
  //               ],
  //             );
  //           },
  //           itemCount: filterData.length,
  //         );
  // }

  // Widget buildTabBar() {
  //   return TabBar(
  //     padding: EdgeInsets.zero,
  //     controller: tabCtrl,
  //     indicatorSize: TabBarIndicatorSize.tab,
  //     labelPadding: EdgeInsets.only(left: 5, right: 5),
  //     indicatorColor: Colors.transparent,
  //     unselectedLabelColor: Colors.white,
  //     dividerColor: Colors.transparent,
  //     indicatorAnimation: TabIndicatorAnimation.elastic,
  //     onTap: (value) {
  //       setState(() {
  //         activeIndex = value;
  //       });
  //     },
  //     tabs: [
  //       Tab(
  //         child: buildTab("C/Cpp", 0),
  //       ),
  //       Tab(
  //         child: buildTab("C-shape", 1),
  //       ),
  //       Tab(
  //         child: buildTab("Flutter", 2),
  //       ),
  //     ],
  //   );
  // }

  // Widget buildTab(String text, int index) {
  //   return Container(
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       color: activeIndex == index
  //           ? Colors.white
  //           : Colors.grey.withValues(alpha: 0.4),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Center(
  //       child: Text(text),
  //     ),
  //   );
  // }

  Widget buildStudentList() {
    return ListView.builder(
      // listview have scholl srab so we use physics; if have singlechild kor douy
      itemBuilder: (context, index) {
        var fullName =
            "${studentData[index]["firstname"]} ${studentData[index]["lastname"]} ";
        var dob = " ${studentData[index]["dob"]}";
        var gender = "${studentData[index]["gender"]}";
        var image = "${studentData[index]["image"]}";
        var id = studentData[index]["id"];
        var firstname = "${studentData[index]["firstname"]}";
        var lastname = "${studentData[index]["lastname"]}";
        var classId = "${studentData[index]["classId"]}";

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            height: 80,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffcebbf0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 60,
                    width: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Image.file(
                      File(image),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person_2_outlined,
                          size: 30,
                          color: Colors.black,
                        );
                      },
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          fullName.toUpperCase(),
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: gender == "Male" ? Colors.blue : Colors.pink,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            gender,
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "DOB: $dob",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      showDragHandle: true,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.file(
                                        File(image),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Icon(
                                            Icons.person_2_outlined,
                                            size: 30,
                                            color: Colors.black,
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              fullName.toUpperCase(),
                                              style: GoogleFonts.spaceGrotesk(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                height: 1,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: gender == "Male"
                                                    ? Colors.blue
                                                    : Colors.pink,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                gender,
                                                style: GoogleFonts.spaceGrotesk(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "DOB: $dob",
                                          style: GoogleFonts.spaceGrotesk(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(
                                      context,
                                      Approutes.addStudent1,
                                      arguments: {
                                        "id": id,
                                        "firstname": firstname,
                                        "lastname": lastname,
                                        "dob": dob,
                                        "gender": gender,
                                        "image": image,
                                      },
                                    ).then(
                                      (value) {
                                        loadData();
                                      },
                                    );
                                  },
                                  leading: Icon(Icons.edit),
                                  title: Text("Update Student"),
                                ),
                                ListTile(
                                  onTap: () {
                                    DatabaseHelper().DdeleteStudent(id);
                                    Navigator.pop(context);
                                    loadData();
                                  },
                                  leading: Icon(Icons.delete),
                                  title: Text("Delete Student"),
                                  iconColor: Colors.red,
                                  textColor: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                )
                // IconButton(
                //   Icons.more_horiz,
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        );
      },
      itemCount: studentData.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
