import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/pharmacy.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/utils/database_helper_phar.dart';
import 'AddPharmacy.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mapScreen.dart';
class pharmacy extends StatefulWidget {
  String UserName;
  pharmacy(this.UserName);
  @override
  pharmacy_pharmacyState createState() => pharmacy_pharmacyState(this.UserName);
}

class pharmacy_pharmacyState extends State<pharmacy> {
  String UserName;
  pharmacy_pharmacyState(this.UserName);
  List<Pharmacy> items = List();
  DatabaseHelperPhar db = new DatabaseHelperPhar();
  User user;
  bool _isvisible = false;
  int _currentIndex =0;
  @override
  void initState() {
    super.initState();
    db.getAllPharmacys().then((pharmacys) {
      setState(() {
        pharmacys.forEach((pharmacy) {
          items.add(Pharmacy.fromMap(pharmacy));
        });
      });
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:
      Column(
        children: <Widget>[
          Expanded(
            child:  ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, position) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Image.asset('assets/Image/pharmacy.ico'),
                          ],
                        ),
                        margin: EdgeInsets.only(top: 30, right: 30, left: 30),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff6D6298),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 200,
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
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left:8.0,right: 8,bottom:8,top:8),
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
                                          '${items[position].phone}',
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          '${items[position].address}',
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
                        EdgeInsets.only(top: 40, right: 30, left: 30),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffd7d6e6)
                        ),
                      ),
                      Visibility(
                        visible : UserName == 'admin' ? !_isvisible: _isvisible,
                        child: Padding(
                          padding: const EdgeInsets.only(right:285),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                    Icons.edit,
                                    color: Color(0xff6D6298)
                                ),
                                onPressed: () => _navigateToPharmacy(
                                    context, items[position]),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Color(0xff6D6298),
                                  ),
                                  onPressed: () => _deletePharmacy(
                                      context,
                                      items[position],
                                      position))
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
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
            _createNewPharmacy(context);
          },
          backgroundColor: Color(0xff6D6298),
        ),
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
      ),    );
  }

  _deletePharmacy(BuildContext context, Pharmacy pharmacy, int position) async {
    db.deletePharmacy(pharmacy.id).then((pharmacys) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToPharmacy(BuildContext context, Pharmacy pharmacy) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPharmacy(pharmacy)),
    );

    if (result == 'update') {
      db.getAllPharmacys().then((pharmacys) {
        setState(() {
          items.clear();
          pharmacys.forEach((pharmacy) {
            items.add(Pharmacy.fromMap(pharmacy));
          });
        });
      });
    }
  }

  void _createNewPharmacy(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddPharmacy(Pharmacy('', '', '', '', ''))),
    );

    if (result == 'save') {
      db.getAllPharmacys().then((pharmacys) {
        setState(() {
          items.clear();
          pharmacys.forEach((pharmacy) {
            items.add(Pharmacy.fromMap(pharmacy));
          });
        });
      });
    }
  }
}
