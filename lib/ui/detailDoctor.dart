import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'logIn.dart';
class TaskScreen extends StatefulWidget {
  String Name, Spec;
  TaskScreen(this.Name, this.Spec);
  @override
  State<StatefulWidget> createState() {
    return StateTaskScreen(this.Name, this.Spec);
  }
}
class StateTaskScreen extends State<TaskScreen> {
  String Name, Spec;
  StateTaskScreen(this.Name, this.Spec);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
            color: Colors.white,
            child: ListView(
              children: [
                ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          ExactAssetImage('assets/Image/fdoctor.jpg'),
                      radius: 50,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ListTile(
                          title: Text(
                            '$Name',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          subtitle: Text(
                            '$Spec ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, right: 14.0),
                              child: Icon(
                                Icons.phone,
                                color: Color(0xff453097),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, right: 14.0),
                              child: Icon(
                                Icons.message,
                                color: Color(0xff453097),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, right: 14.0),
                              child: Icon(
                                Icons.phone_iphone,
                                color: Color(0xff453097),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                ),
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
                    'هنا شرح مبسط عن الطبيب أين درس و موقعه ..الخ',
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'مواعيد الدوام الحالية',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 5, right: 10,left: 10),
                 // padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xff4d36ad).withAlpha(75),

                  ),
                  child: ListTile(
                    title: Text('موعد المعاينة',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    subtitle: Text(
                      '  الأحد 9ص - 3م ',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    //  leading: ,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, right: 10,left: 10),
                  // padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color:Color(0xff6F649D),
                  ),
                  child: ListTile(
                    title: Text('موعد المعاينة',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    subtitle: Text(
                      '  الاثنين 9ص - 3م ',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    //  leading: ,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, right: 10,left: 10),
                  // padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color:Color(0xff4d36ad).withAlpha(75),
                  ),
                  child: ListTile(
                    title: Text('موعد المعاينة',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    subtitle: Text(
                      '  الثلاثاء 9ص - 3م ',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    //  leading: ,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, right: 10,left: 10),
                  // padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xff6F649D),

                  ),
                  child: ListTile(
                    title: Text('موعد المعاينة',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    subtitle: Text(
                      '  الاربعاء 9ص - 3م ',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    //  leading: ,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, right: 10,left: 10),
                  // padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color:Color(0xff4d36ad).withAlpha(75),
                  ),
                  child: ListTile(
                    title: Text('موعد المعاينة',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    subtitle: Text(
                      '  الخميس 9ص - 3م ',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    //  leading: ,
                  ),
                ),
              ],
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          GestureDetector(
            child: Icon(Icons.login_outlined, color: Colors.white, size: 30),
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));},
          ),
        ],
        color: Color(0xff453097),
        backgroundColor: Colors.white,
      ),
    );
  }
}
