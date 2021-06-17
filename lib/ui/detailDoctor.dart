import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TaskScreen extends StatefulWidget {
  String Name, Spec, About, From, To, Phone;
  TaskScreen(this.Name, this.Spec, this.About, this.From, this.To, this.Phone);
  @override
  State<StatefulWidget> createState() {
    return StateTaskScreen(
        this.Name, this.Spec, this.About, this.From, this.To, this.Phone);
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

  String Name, Spec, About, From, To, Phone;
  StateTaskScreen(
      this.Name, this.Spec, this.About, this.From, this.To, this.Phone);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/Image/ddoctor.jpg'),
              fit: BoxFit.cover,
            )),
            padding:
                EdgeInsets.only(top: 60.0, left: 30, right: 30, bottom: 90),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                    ),
                color: Color(0xff4d36ad).withAlpha(75),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                //  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                      title: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.end,
                    //  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          '$Name',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$Spec ',
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () =>
                                      _launchCaller("tel:" + Phone),
                                  child: Text(
                                    '$Phone ',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        color: Colors.blue),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(top:11.0),
                                child: Icon(FlutterIcons.phone_in_talk_mco),
                              ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'حول الطبيب',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      '$About',
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'دوام اليوم',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      // width: ,
                      // margin: EdgeInsets.only( right: 10, left: 10),
                      padding: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xff4d36ad).withAlpha(75),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.access_time_rounded),
                          Text('$To',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(
                            ':الانتهاء ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              //  color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Icon(Icons.access_time_rounded),
                          Text('$From',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(
                            ':البدء ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              //  color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        items: <Widget>[
          GestureDetector(
            child: Icon(Icons.stay_current_portrait,
                color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.location_pin, color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home(UserName)));
            },
          ),
          GestureDetector(
            child: Icon(Icons.login_outlined, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
        color: Color(0xff6D6298),
        backgroundColor: Colors.white,
      ),
    );
  }
}
