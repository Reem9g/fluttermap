import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'logIn.dart';

class AddDoctors extends StatefulWidget {
  @override
  createState() => AddDoctorsState();
}

class AddDoctorsState extends State<AddDoctors> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          Expanded(
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0, top: 40,left: 5.0),
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      //  height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.home,
                              color: Color(0xff4d36ad)),
                          hintText: 'اسم الطبيب',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                            // fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 20,left: 10.0),
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      //  height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.phone,
                              color: Color(0xff4d36ad)),
                          hintText: 'رقم الطبيب',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                            // fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 20,left: 10.0),
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: size.width * 0.8,
                      //  height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Color(0xff4d36ad).withAlpha(50),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
                        cursorColor: Color(0xff4d36ad),
                        decoration: InputDecoration(
                          icon: Icon(Icons.speaker,
                              color: Color(0xff4d36ad)),
                          hintText: 'اختصاص الطبيب',
                          hintStyle: TextStyle(
                            color: Color(0xff4d36ad),
                            // fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left:100, right: 100, top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //  borderRadius: BorderRadius.all(Radius.circular(33)),
                            color: Color(0xff4d36ad)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'حفظ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    /* onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home()));
                    },*/
                  ),
                ],
              )
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //  key: _bottomNavigationKey,
        //  index: 2,
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
        // buttonBackgroundColor: Colors.red,
        backgroundColor: Color(0xffffffff),
        //  animationCurve: Curves.easeInOut,
        //  animationDuration: Duration(milliseconds: 600),
        /*  onTap: (index) {
             setState(() {
            _page = index;
          });
        },*/
        letIndexChange: (index) => true,
      ),
    );
  }
}
