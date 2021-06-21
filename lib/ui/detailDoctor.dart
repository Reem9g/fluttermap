import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
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
          Text(
            '$Name',
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
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Color(0xff6D6298),
            //  color: Color(0xff6D6298),
            style: TabStyle.react,
            items: [
              TabItem(icon: Icons.stay_current_portrait),
              TabItem(icon: Icons.location_pin),
              TabItem(icon: Icons.home_outlined,),
              TabItem(icon: Icons.login_outlined),
            ],
            initialActiveIndex: 0,
            onTap: (int i) {
              if(i==1)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => map()));
              else if(i==2)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home(UserName)));
              else if(i==3)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
            }
        )
    );
  }
}
