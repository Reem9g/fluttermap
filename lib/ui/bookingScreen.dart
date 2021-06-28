import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/booking.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/utils/database_helper_Booking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'Booking.dart';

class BookingScreen extends StatefulWidget {
  final String doctor;
  final Bookings booking;

  const BookingScreen({Key key, this.doctor, this.booking}) : super(key: key);
  @override
  _BookingScreenState createState() => _BookingScreenState(this.doctor);
}

class _BookingScreenState extends State<BookingScreen> {

  String doctor;
  _BookingScreenState(this.doctor);

  DatabaseHelperBooking db = new DatabaseHelperBooking();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  String timeText = 'Select Time';
  String dateUTC;
  String date_Time;

  User user;


  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    ).then(
      (date) {
        setState(
          () {
            selectedDate = date;
            String formattedDate =
                DateFormat('dd-MM-yyyy').format(selectedDate);
            _dateController.text = formattedDate;
            dateUTC = DateFormat('yyyy-MM-dd').format(selectedDate);
          },
        );
      },
    );
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );

    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    String formattedTime = localizations.formatTimeOfDay(selectedTime,
        alwaysUse24HourFormat: false);

    if (formattedTime != null) {
      setState(() {
        timeText = formattedTime;
        _timeController.text = timeText;
      });
    }
    date_Time = selectedTime.toString().substring(10, 15);
  }

  @override
  void initState() {
    super.initState();
    selectTime(context);
    _doctorController.text = doctor;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'حجز موعد',
            style: GoogleFonts.lato(
              color: Color(0xff6D6298),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Icon(
          Icons.chevron_left_sharp,
        ),
        iconTheme: IconThemeData(
          color: Color(0xff6D6298),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return;
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                child: Image(
                  image: AssetImage('assets/Image/appointment.jpg'),
                  height: 250,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'ادخل تفاصيل المريض',
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        controller: _nameController,
                        focusNode: f1,
                        validator: (value) {
                          if (value.isEmpty) return 'لطفاً ادخل اسم المريض';
                          return null;
                        },
                        decoration: InputDecoration(
                          // icon: Icon(Icons.person, color: Color(0xff4d36ad)),
                          contentPadding:
                              EdgeInsets.only(right: 20, top: 10, bottom: 10),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xff4d36ad).withAlpha(50),
                          hintText: 'اسم المريض',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          f1.unfocus();
                          FocusScope.of(context).requestFocus(f2);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        keyboardType: TextInputType.phone,
                        focusNode: f2,
                        controller: _phoneController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 20, top: 10, bottom: 10),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xff4d36ad).withAlpha(50),
                          hintText: 'رقم الهاتف',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'لطفاً ادخل رقم الهاتف';
                          } else if (value.length < 10) {
                            return 'لطفاً ادخل رقم الهاتف بشكل صحيح';
                          }
                          return null;
                        },
                        onFieldSubmitted: (String value) {
                          f2.unfocus();
                          FocusScope.of(context).requestFocus(f3);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        focusNode: f3,
                        controller: _descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 20, top: 10, bottom: 10),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xff4d36ad).withAlpha(50),
                          hintText: 'وصف حالة المريض',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                        ),
                        onFieldSubmitted: (String value) {
                          f3.unfocus();
                          FocusScope.of(context).requestFocus(f4);
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        enabled: false,
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        controller: _doctorController,
                        validator: (value) {
                          if (value.isEmpty) return 'لطفاً ادخل اسم الطبيب';
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 20, top: 10, bottom: 10),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xff4d36ad).withAlpha(50),
                          hintText: 'اسم الطبيب',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              textAlign: TextAlign.right,
                              cursorColor: Color(0xff4d36ad),
                              focusNode: f4,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  right: 20,
                                  top: 10,
                                  bottom: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color(0xff4d36ad).withAlpha(50),
                                hintText: 'التاريخ',
                                hintStyle: TextStyle(
                                  color: Color(0xff4d36ad),
                                ),
                              ),
                              controller: _dateController,
                              validator: (value) {
                                if (value.isEmpty) return 'لطفاً ادخل التاريخ';
                                return null;
                              },
                              onFieldSubmitted: (String value) {
                                f4.unfocus();
                                FocusScope.of(context).requestFocus(f5);
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 235.0),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.indigo, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      selectDate(context);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              textAlign: TextAlign.right,
                              cursorColor: Color(0xff4d36ad),
                              focusNode: f5,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  right: 20,
                                  top: 10,
                                  bottom: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color(0xff4d36ad).withAlpha(50),
                                hintText: 'الوقت',
                                hintStyle: TextStyle(
                                  color: Color(0xff4d36ad),
                                ),
                              ),
                              controller: _timeController,
                              validator: (value) {
                                if (value.isEmpty) return 'لطفاً ادخل الوقت';
                                return null;
                              },
                              onFieldSubmitted: (String value) {
                                f5.unfocus();
                              },
                              textInputAction: TextInputAction.next,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 235.0),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.indigo, // button color
                                  child: InkWell(
                                    // inkwell color
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        Icons.timer_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      selectTime(context);
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Colors.indigo,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            _createAppointment();
                            if (_formKey.currentState.validate()) {
                              // print(_nameController.text);
                              // print(_dateController.text);
                              // print(widget.doctor);
                              _nameController.text = '';
                              _phoneController.text = '';
                              _descriptionController.text = '';
                              _doctorController.text = '';
                              _dateController.text = '';
                              _timeController.text = '';
                            }
                          },
                          child: Text(
                            "تم",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAppointment() async {
    print(dateUTC + ' ' + date_Time + ':00');
    db.saveBooking(Bookings(
      _nameController.text,
      _dateController.text,
      _timeController.text,
        _doctorController.text

    ))
        .then(
          (_) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(doctor)));
      //  Navigator.pop(context, 'save');
      },
    );
  }

}
