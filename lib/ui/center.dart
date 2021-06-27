import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/utils/databasee_helper_center.dart';
import 'package:flutter_app_mab/model/center.dart';
import 'doctor.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:flutter_app_mab/ui/AddCenter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mapScreen.dart';


class centerCards extends StatefulWidget {
  String UserName;
  centerCards(this.UserName);
  @override
  centerCards_state createState() => centerCards_state(this.UserName);
}

class centerCards_state extends State<centerCards> {
  String UserName;
  centerCards_state(this.UserName);
  List<Centerr> items = List();
  DatabaseHelperCenter db = new DatabaseHelperCenter();
  int _currentIndex = 0;
  User user;
  bool _isvisible = false;
  @override
  void initState() {
    super.initState();
    db.getAllCenters().then((centers) {
      setState(() {
        centers.forEach((center) {
          items.add(Centerr.fromMap(center));
        });
      });
    });
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
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
                  // onFieldSubmitted: (String value) {
                  //
                  //   setState(
                  //         () {
                  //       value.length == 0
                  //           ? Container()
                  //           : Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => SearchList(
                  //             searchKey: value,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   );
                  // },
                  onChanged: (String text) async {

                    // List<Map> res = await database.rawQuery(
                    //     "SELECT name FROM DoctorTable WHERE name LIKE '%${text}%' ");
                    // print(res);

                    //Database db = await DatabaseHelper.instance.database;
                    // List<Map> result = await db.rawQuery("SELECT content FROM table WHERE content LIKE '%${text}%'");

                    // setState(() {
                    //   result.forEach((element) {
                    //     print(element);
                    //     course = result;
                    //   });
                    //
                    // });
                  },
                  cursorColor: Colors.blue[900].withOpacity(0.9),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.blue[100],
                    //Color(0xffC3D9F1),
                    hintText: 'بحث',
                    hintStyle: GoogleFonts.lato(
                      color: Colors.blue[900].withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[900].withOpacity(0.9),
                        //  Color(0xff6D6298),
                        borderRadius: BorderRadius.circular(15.0),
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
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Stack(
                      children: <Widget>[
                        Container(
                            height: 110,
                            width: 400,
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: <Widget>[
                                          Text('${items[position].from}',),
                                          Text(' :البدء',
                                              //  textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              )),
                                        ],
                                      ),
                                    ),
                                    Row(
                                        children: <Widget>[
                                          Text('${items[position].to}'),
                                          Text(' :الانتهاء',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),

                                        ],
                                      ),
                                    TextButton(onPressed: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  D_details(UserName)));
                                    },
                                        child: Text('لمعرفة الأقسام في المركز',textAlign: TextAlign.center,style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),))
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0,right: 8,bottom:4,top:4),
                                    child: ListTile(
                                        title: Text(
                                          '${items[position].name}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Text(
                                              ' رقم الهاتف: ${items[position].phone}',
                                              textAlign: TextAlign.right,
                                            ),
                                            Text(
                                              ' العنوان: ${items[position].address}',
                                              textAlign: TextAlign.right,
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                        )),
                                  ),
                                ),

                              ],
                            ),
                            margin:
                            EdgeInsets.only(top: 20, right: 30, left: 30),
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffd7d6e6)
                            ),
                          ),
                        Visibility(
                          visible : UserName == 'admin' ? !_isvisible: _isvisible,
                          child: Padding(
                            padding: const EdgeInsets.only(right:285,top:3),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                      Icons.edit,
                                      color: Color(0xff6D6298)
                                  ),
                                  onPressed: () => _navigateToCenter(
                                      context, items[position]),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Color(0xff6D6298),
                                    ),
                                    onPressed: () => _deleteCenter(
                                        context,
                                        items[position],
                                        position))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  })
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible : UserName == 'admin' ? !_isvisible: _isvisible,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _createNewLabortoryCenter(context);
          },
          backgroundColor: Color(0xff6D6298),
        ),
      ),
       bottomNavigationBar:
       // GNav(
       //   curve: Curves.easeOutExpo,
       //   rippleColor: Colors.grey[300],
       //   hoverColor: Colors.grey[100],
       //   haptic: true,
       //   tabBorderRadius: 20,
       //   gap: 5,
       //   activeColor: Colors.white,
       //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
       //   duration: Duration(milliseconds: 400),
       //   tabBackgroundColor: Colors.blue.withOpacity(0.7),
       //   textStyle: GoogleFonts.lato(
       //     color: Colors.white,
       //   ),
       //   tabs: [
       //     GButton(
       //       iconSize: _selectedIndex != 0 ? 28 : 25,
       //       icon: _selectedIndex == 0
       //           ? FlutterIcons.home_fou
       //           : FlutterIcons.home_variant_outline_mco,
       //       text: 'Home',
       //     ),
       //     GButton(
       //       icon: FlutterIcons.search1_ant,
       //       text: 'Search',
       //     ),
       //     GButton(
       //       iconSize: 25,
       //       icon: _selectedIndex == 2
       //           ? Typicons.calendar
       //           : Typicons.calendar_outline,
       //       text: 'Schedule',
       //     ),
       //     GButton(
       //       iconSize: 25,
       //       icon: _selectedIndex == 3
       //           ? Typicons.user
       //           : Typicons.user_outline,
       //       text: 'Profile',
       //     ),
       //   ],
       //   selectedIndex: _selectedIndex,
       //   onTabChange: _onItemTapped,
       // ),
      BottomNavyBar(
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

  _deleteCenter(
      BuildContext context, Centerr center, int position) async {
    db.deleteCenter(center.id).then((centers) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToCenter(BuildContext context, Centerr center) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCenters(center)),
    );

    if (result == 'update') {
      db.getAllCenters().then((centers) {
        setState(() {
          items.clear();
          centers.forEach((center) {
            items.add(Centerr.fromMap(center));
          });
        });
      });
    }
  }

  void _createNewLabortoryCenter(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddCenters(Centerr('', '', '', '', ''))),
    );

    if (result == 'save') {
      db.getAllCenters().then((centers) {
        setState(() {
          items.clear();
          centers.forEach((center) {
            items.add(Centerr.fromMap(center));
          });
        });
      });
    }
  }
}
