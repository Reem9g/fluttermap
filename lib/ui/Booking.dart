import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/booking.dart';
import 'package:flutter_app_mab/ui/searchList.dart';
import 'package:flutter_app_mab/utils/database_helper_Booking.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mapScreen.dart';


class Booking extends StatefulWidget {

  String nameDoctor;
  Booking(this.nameDoctor);
  @override
  Booking_state createState() => Booking_state(this.nameDoctor);
}

class Booking_state extends State<Booking> {
  String nameDoctor;
  Booking_state(this.nameDoctor);

  String UserName;
  int _currentIndex = 0;
  List<Bookings> items = List();
  DatabaseHelperBooking db = new DatabaseHelperBooking();

  @override
  void initState() {
    super.initState();
    db.getAllBookings().then((bookings) {
      setState(() {
        bookings.forEach((booking) {
          items.add(Bookings.fromMap(booking));
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
                    return items[position].nameDoctor == nameDoctor?Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {},
                        child: ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'اسم الطبيب: $nameDoctor',
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 0,
                              ),
                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                            'التاريخ: ${items[position].date}',
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
                                        'اسم المريض: ${items[position].name}',
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${items[position].time}',
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) : Center();
                  })
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 15,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          if(_currentIndex == 1)
            Navigator.push(context, MaterialPageRoute(builder: (context) => map()));
          else if (_currentIndex == 2)
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (_) => Home(UserName)),
                    (Route<dynamic> route) => false
            );
          else if (_currentIndex == 3)
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (_) => LoginScreen()),
                    (Route<dynamic> route) => false
            );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.stay_current_portrait),
            title: Text('الصفحة الحالية'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.location_pin),
            title: Text('الخريطة'),
            activeColor: Colors.blue.withOpacity(0.7),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.home_outlined,),
            title: Text(
              'الصفحة الرئيسية',
            ),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.login_outlined),
            title: Text(''),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

  }
  _deleteBooking(
      BuildContext context, Bookings booking, int position) async {
    db.deleteBooking(booking.id).then((centers) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void showAlertDialog(BuildContext context) {
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
        //  deleteAppointment(_documentID);
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
  }
}
