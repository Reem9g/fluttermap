import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/cardModel.dart';
import 'package:flutter_app_mab/ui/spcialized.dart';
import 'package:flutter_app_mab/ui/detailDoctor.dart';
import 'carouselSlider.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:google_fonts/google_fonts.dart';

//OldCode
/*import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/spcialized.dart';
import 'package:flutter_app_mab/ui/AddSpec.dart';
import 'package:flutter_app_mab/ui/spcialized.dart';
import 'package:flutter_app_mab/ui/detailDoctor.dart';
import 'package:flutter_app_mab/utils/database_helper_spec.dart';
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
*/

class D_details extends StatefulWidget {
  String UserName;
  D_details(this.UserName);
  @override
  State<StatefulWidget> createState() {
    return stateD_details(this.UserName);
  }
}

class stateD_details extends State<D_details> {
  String UserName;
  stateD_details(this.UserName);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[Container()],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 25),
                child: TextFormField(
                  cursorColor: Color(0xff4d36ad),
                  textInputAction: TextInputAction.search,
                  // controller: _doctorName,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffd7d6e6),
                    hintText: 'بحث',
                    hintStyle: GoogleFonts.lato(
                      color: Color(0xff453097).withAlpha(50),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: //Colors.blue[900].withOpacity(0.9),
                            Color(0xff6D6298),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        splashRadius: 20,
                        color: Colors.white,
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  /* onFieldSubmitted: (String value) {
                setState(
                      () {
                    value.length == 0
                        ? Container()
                        : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchList(
                          searchKey: value,
                        ),
                      ),
                    );
                  },
                );
              },*/
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
       // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10,top:15),
           // alignment: Alignment.centerLeft,
            child: Text(
              "! اهتم بصحتك جيداً",
              textAlign: TextAlign.right,
              style: GoogleFonts.lato(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Carouselslider(),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 150,
            padding: EdgeInsets.only(top: 14),
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 14),
                  height: 150,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(cards[index].cardBackground),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400],
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                          offset: Offset(3, 3),
                        ),
                      ]
                      ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Spc_Doctors(cards[index].doctor,UserName)));
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 29,
                              child: Icon(
                                cards[index].cardIcon,
                                size: 26,
                                color: Color(cards[index].cardBackground),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            cards[index].doctor,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
                  context, MaterialPageRoute(builder: (context) => Home('')));
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
