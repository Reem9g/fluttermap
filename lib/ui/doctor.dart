import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/ui/spcialized.dart';
import 'package:flutter_app_mab/ui/detailDoctor.dart';
import 'home_page.dart';
import 'logIn.dart';
class D_details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return stateD_details();
  }
}
class stateD_details extends State<D_details> {
  List tags = [
    'قلبية',
    'صدرية',
    'أسنان',
    'عينية',
    'أطفال',
    'جلدية',
    'نسائية',
    'أذنية'
  ];
  List Images_Spec = [
    'assets/Image/heart.ico',
    'assets/Image/torso.ico',
    'assets/Image/tooth.ico',
    'assets/Image/ophthalmology.ico',
    'assets/Image/children.ico',
    'assets/Image/skin.ico',
    'assets/Image/pregnant.ico',
    'assets/Image/hearing.ico',
  ];
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
     // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child:Expanded(
              child: Column(
                //physics: const ScrollPhysics(),
               // physics: const AlwaysScrollableScrollPhysics(),
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 8, right: 8, bottom: 8),
                      child: Text(
                        'الاختصاصات',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4d36ad),
                        ),
                      ),
                    ),
                    Container(
                      height: 85,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tags.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                // Container that contain the spec
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0),
                                  child: GestureDetector(
                                    child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Color(0xff4d36ad),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50.0,
                                            bottom: 5,
                                            right: 10,
                                            left: 10),
                                        child: Text(
                                          tags[index],
                                          style: TextStyle(
                                            color: Color(0xff4d36ad),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    onTap:  () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Spc_Doctors(tags[index])));
                                    },
                                  ),
                                ),
                                // Container that contain the Images
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: GestureDetector(
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        width: 60,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(15)),
                                            color: Color(0xff4d36ad)),
                                        child: Image.asset(
                                          Images_Spec[index],
                                          scale: 1.5,
                                        )),
                                    onTap:  () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Spc_Doctors(tags[index])));
                                    },
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0),
                      child: Text(
                        'أبرز الأطباء',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4d36ad),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 371,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: tags.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
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
                                        tags[index],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                      //  leading: ,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TaskScreen(Names[index],tags[index])));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
            ),
          ),
        ],
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
