import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/doctor.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/ui/AddDoctor.dart';
import 'package:flutter_app_mab/utils/database_helper_doctor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailDoctor.dart';
import 'home_page.dart';
import 'logIn.dart';

class Spc_Doctors extends StatefulWidget {
  String UserName;
  String Spec;
  Spc_Doctors(this.Spec,this.UserName);
  @override
  State<StatefulWidget> createState() {
    return stateSpc_Doctors(this.Spec,this.UserName);
  }
}

class stateSpc_Doctors extends State<Spc_Doctors> {

  String Spec,UserName;
  stateSpc_Doctors(this.Spec,this.UserName);
  List<Doctor> items = List();
  DatabaseHelperDoctor db = new DatabaseHelperDoctor();
  User user;
  bool _isvisible = false;
  @override
  void initState() {
    super.initState();
    db.getAllDoctors().then((doctors){
      setState(() {
        doctors.forEach((doctor){
          items.add(Doctor.fromMap(doctor));
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
          child:
          Column(
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
         // height: MediaQuery.of(context).size.height - 100,
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 15.0, bottom: 8.0,top:15),
                      child: Container(
                        height: 80,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff6D6298).withAlpha(150)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: new Text(
                                '${items[index].name}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              subtitle: new Text('$Spec',
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
                                            TaskScreen(items[index].name, '$Spec',
                                                items[index].about,
                                                items[index].from,
                                                items[index].to,
                                              items[index].phone,
                                            )));
                              },
                            ),
                          ],
                        ),
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
                              onPressed: () => _navigateToDoctor(
                                  context, items[index]),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Color(0xff6D6298),
                                ),
                                onPressed: () => _deleteDoctor(
                                    context,
                                    items[index],
                                    index))
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ]),
      floatingActionButton: Visibility(
        visible : UserName == 'admin' ? !_isvisible: _isvisible,
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _createNewDoctor(context);
          },
          backgroundColor: Color(0xff6D6298),
        ),
      ),
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


  _deleteDoctor(
      BuildContext context, Doctor doctor, int position) async {
    db.deleteDoctor(doctor.id).then((doctors) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToDoctor(BuildContext context, Doctor doctor) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDoctors(doctor)),
    );

    if (result == 'update') {
      db.getAllDoctors().then((doctors) {
        setState(() {
          items.clear();
          doctors.forEach((doctor) {
            items.add(Doctor.fromMap(doctor));
          });
        });
      });
    }
  }

  void _createNewDoctor(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddDoctors(Doctor('', '', '', '', '',''))),
    );

    if (result == 'save') {
      db.getAllDoctors().then((doctors) {
        setState(() {
          items.clear();
          doctors.forEach((doctor) {
            items.add(Doctor.fromMap(doctor));
          });
        });
      });
    }
  }
}
