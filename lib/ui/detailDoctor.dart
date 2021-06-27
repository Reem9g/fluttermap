import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Booking.dart';
import 'bookingScreen.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'mapScreen.dart';

class TaskScreen extends StatefulWidget {
  String Name, Spec, About, From, To, Phone,UserName,Address;
  TaskScreen(this.Name, this.Spec, this.About, this.From, this.To, this.Phone,this.UserName,this.Address);
  @override
  State<StatefulWidget> createState() {
    return StateTaskScreen(
        this.Name, this.Spec, this.About, this.From, this.To, this.Phone,this.UserName,this.Address);
  }
}

class StateTaskScreen extends State<TaskScreen> {
  _launchCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String Name, Spec, About, From, To, Phone,UserName,Address;
  StateTaskScreen(
      this.Name, this.Spec, this.About, this.From, this.To, this.Phone,this.UserName,this.Address);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 50,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 5),
            child: IconButton(
              icon: Icon(
                Icons.chevron_left_sharp,
                color: Color(0xff6D6298),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xff6D6298),
                width: 1, style: BorderStyle.solid),
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/Image/ddoctor.jpg')
            )
        ),
      ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$Name',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              '$Spec ',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              //fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.only(left: 22, right: 22),
            alignment: Alignment.center,
            child: Text(
              '$About',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.place_outlined),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Text(
                    '$Address',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(FlutterIcons.phone_in_talk_mco),
                SizedBox(
                  width: 11,
                ),
                TextButton(
                  onPressed: () =>
                      _launchCaller("tel:" + Phone),
                  child: Text(
                    '$Phone',
                    style: GoogleFonts.lato(
                        fontSize: 16, color: Colors.blue),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.access_time_rounded),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'ساعات العمل',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Text(
                  'اليوم : ',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$From' +
                      " - " +
                      '$To',
                  style: GoogleFonts.lato(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(FlutterIcons.calendar_account_mco),
                SizedBox(
                  width: 11,
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Booking(Name))),
                  child: Text(
                    'حجوزات الطبيب',
                    style: GoogleFonts.lato(
                        fontSize: 16, color: Colors.blue),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2,
                primary: Colors.indigo.withOpacity(0.9),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(
                      doctor:  '$Name',
                    ),
                  ),
                );
              },
              child: Text(
                'لحجز موعد',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // Container(
          //   height: 200,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //     image: AssetImage('assets/Image/ddoctor.jpg'),
          //     fit: BoxFit.cover,
          //   )),
          //   padding:
          //       EdgeInsets.only(top: 60.0, left: 30, right: 30, bottom: 90),
          // ),
          // Expanded(
          //     child: Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(50),
          //         topRight: Radius.circular(50)
          //           ),
          //       color: Color(0xff4d36ad).withAlpha(75),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.only(top:20.0),
          //     child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //       //  mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         ListTile(
          //             title: Column(
          //           //  crossAxisAlignment: CrossAxisAlignment.end,
          //           //  mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             ListTile(
          //               title: Text(
          //                 '$Name',
          //                 style: TextStyle(
          //                   fontSize: 22,
          //                 ),
          //                 textAlign: TextAlign.right,
          //               ),
          //               subtitle: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Text(
          //                     '$Spec ',
          //                     textAlign: TextAlign.right,
          //                     style: TextStyle(fontSize: 20),
          //                   ),
          //                   Row(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     mainAxisAlignment: MainAxisAlignment.end,
          //                     children: [
          //                       TextButton(
          //                         onPressed: () =>
          //                             _launchCaller("tel:" + Phone),
          //                         child: Text(
          //                           '$Phone ',
          //                           textAlign: TextAlign.right,
          //                           style: GoogleFonts.lato(
          //                               fontSize: 20,
          //                               color: Colors.blue),
          //                         ),
          //                       ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(top:11.0),
          //                       child: Icon(FlutterIcons.phone_in_talk_mco),
          //                     ),
          //
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         )),
          //         Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: Text(
          //             'حول الطبيب',
          //             textAlign: TextAlign.right,
          //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          //           child: Text(
          //             '$About',
          //             textAlign: TextAlign.right,
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: Text(
          //             'دوام اليوم',
          //             textAlign: TextAlign.right,
          //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Container(
          //             height: 50,
          //             // width: ,
          //             // margin: EdgeInsets.only( right: 10, left: 10),
          //             padding: EdgeInsets.only(bottom: 15),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.all(Radius.circular(15)),
          //               color: Color(0xff4d36ad).withAlpha(75),
          //             ),
          //             child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               children: [
          //                 Icon(Icons.access_time_rounded),
          //                 Text('$To',
          //                     textAlign: TextAlign.right,
          //                     style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                         color: Colors.white)),
          //                 Text(
          //                   ':الانتهاء ',
          //                   textAlign: TextAlign.right,
          //                   style: TextStyle(
          //                     //  color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 75,
          //                 ),
          //                 Icon(Icons.access_time_rounded),
          //                 Text('$From',
          //                     textAlign: TextAlign.right,
          //                     style: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                         color: Colors.white)),
          //                 Text(
          //                   ':البدء ',
          //                   textAlign: TextAlign.right,
          //                   style: TextStyle(
          //                     //  color: Colors.white,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 25,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ))
        ],
      ),
      bottomNavigationBar:  BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 15,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          if(_currentIndex == 1)
            Navigator.push(context, MaterialPageRoute(builder: (context) => map()));
          else if (_currentIndex == 2)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home(UserName)));
          else if (_currentIndex == 3)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
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
}
