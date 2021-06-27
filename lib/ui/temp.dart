import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/utils/database_helperUser.dart';
import 'package:google_fonts/google_fonts.dart';
class Temp extends StatefulWidget {

  @override
  Temp_state createState() => Temp_state();
}

class Temp_state extends State<Temp> {

  String UserName;
  int _currentIndex = 0;
  List<User> items = List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();
    db.getAllUsers().then((bookings) {
      setState(() {
        bookings.forEach((booking) {
          items.add(User.fromMap(booking));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {},
                        child: ExpansionTile(
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'التاريخ: ${items[position].username}',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.lato(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'اسم المريض: ${items[position].number}',
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${items[position].password}',
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        '${items[position].flaglogged}',
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    tooltip: 'حذف الموعد',
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.black87,
                                    ),
                                    onPressed: () {
                                      // set up the buttons
                                      Widget cancelButton = TextButton(
                                        child: Text("لا"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                      Widget continueButton = TextButton(
                                        child: Text("نعم"),
                                        onPressed: () {
                                          _deleteBooking(context, items[position], position);
                                          Navigator.of(context).pop();
                                        },
                                      );

                                      // set up the AlertDialog
                                      AlertDialog alert = AlertDialog(
                                        title: Text("تأكيد الحذف"),
                                        content: Text("هل متأكد من حذف هذا الموعد؟"),
                                        actions: [
                                          cancelButton,
                                          continueButton,
                                        ],
                                      );

                                      // show the dialog
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    },
                                  ),
                                  // IconButton(
                                  //   tooltip: 'حذف الموعد',
                                  //   icon: Icon(
                                  //     Icons.delete,
                                  //     color: Colors.black87,
                                  //   ),
                                  //   onPressed: () {
                                  //     // set up the buttons
                                  //     Widget cancelButton = TextButton(
                                  //       child: Text("لا"),
                                  //       onPressed: () {
                                  //         Navigator.of(context).pop();
                                  //       },
                                  //     );
                                  //     Widget continueButton = TextButton(
                                  //       child: Text("نعم"),
                                  //       onPressed: () {
                                  //         _deleteBooking(context, items[position], position);
                                  //         Navigator.of(context).pop();
                                  //       },
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
          ),
        ],
      ),
    );

  }
  _deleteBooking(
      BuildContext context, User booking, int position) async {
    db.deleteUser(booking).then((centers) {
      setState(() {
        items.removeAt(position);
      });
    });
  }
}
