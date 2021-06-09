import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'AddPharmacy.dart';
import 'home_page.dart';
import 'logIn.dart';

class pharmacy extends StatefulWidget {
  @override
  pharmacy_pharmacyState createState() => pharmacy_pharmacyState();
}

class pharmacy_pharmacyState extends State<pharmacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
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
          Container(
            height: MediaQuery.of(context).size.height - 173,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Image.asset('assets/Image/pharmacy.ico'),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 10, right: 30, left: 30),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff453097),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('  From:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('  8:00 AM '),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('  To:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('     11:00 PM '),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                'صيدلية الجميلية',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '2273908',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 10, right: 90, left: 30),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color(0xffd7d6e6)),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Image.asset('assets/Image/pharmacy.ico'),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 30, right: 30, left: 30),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff453097),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('  From:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('  8:00 AM '),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('  To:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('     11:00 PM '),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                'صيدلية حلب الجديدة',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '2273908',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 30, right: 90, left: 30),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color(0xffd7d6e6)),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Image.asset('assets/Image/pharmacy.ico'),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 30, right: 30, left: 30),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff453097),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('  From:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('  8:00 AM '),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('  To:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('     11:00 PM '),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                'صيدلية النيرب',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '2273908',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 30, right: 90, left: 30),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color(0xffd7d6e6)),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Image.asset('assets/Image/pharmacy.ico'),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 30, right: 30, left: 30),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff453097),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('  From:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('  8:00 AM '),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('  To:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('     11:00 PM '),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                'صيدلية السفيرة',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '2273908',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 30, right: 90, left: 30),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color(0xffd7d6e6)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color(0xff453097),
        ),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPharmacy()));
        },
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //  key: _bottomNavigationKey,
        //   index: 1,
        height: 55.0,
        items: <Widget>[
          GestureDetector(
            child: Icon(Icons.stay_current_portrait, color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.location_pin, color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home()));
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
