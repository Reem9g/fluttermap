import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailDoctor.dart';
import 'home_page.dart';
import 'logIn.dart';

class Spc_Doctors extends StatefulWidget {
  String Spec;
  Spc_Doctors(this.Spec);
  @override
  State<StatefulWidget> createState() {
    return stateSpc_Doctors(this.Spec);
  }
}

class stateSpc_Doctors extends State<Spc_Doctors> {
  String Spec;
  stateSpc_Doctors(this.Spec);
  List Names = [
    'د.روان حاج يحيى',
    'د.آية مشلح',
    'د.ريم شيخ شهيد',
    'د.سماحة حاج يحيى',
    'د.زهرة مشلح',
    'د.حلا شيخ شهيد',
    'د.ريان حاج يحيى',
    'د.نور حاج يحيى'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(children: [
        Stack(
          children: <Widget>[
            Container(
              height: 110,
              decoration: BoxDecoration(
                color: Color(0xff453097),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
              ),
            ),
            Positioned(
              top: 40.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff453097),
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff453097)),
                                borderRadius: BorderRadius.circular(50)),
                            prefixIcon:
                                Icon(Icons.search, color: Color(0xff453097)),
                            hintText: "بحث ",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
         // height: MediaQuery.of(context).size.height - 100,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Names.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff4d36ad),
                          Color(0xff6D6298),
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: new Text(
                            Names[index],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                          subtitle: new Text(
                            '$Spec',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xffffffff),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TaskScreen(Names[index], '$Spec')));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        //  key: _bottomNavigationKey,
        // index: 1,
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
                  context, MaterialPageRoute(builder: (context) => Home()));
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
        color: Color(0xff453097),
        // buttonBackgroundColor: Color(0xff453097),
        backgroundColor: Colors.white,
        //  animationCurve: Curves.easeInOut,
        //  animationDuration: Duration(milliseconds: 600),
        /* onTap: (index) {
          setState(() {
            _page = index;
          });
        },*/
        letIndexChange: (index) => true,
      ),
    );
  }
}
