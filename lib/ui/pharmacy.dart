import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/pharmacy.dart';
import 'package:flutter_app_mab/utils/database_helper_phar.dart';
import 'AddPharmacy.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:google_fonts/google_fonts.dart';
class pharmacy extends StatefulWidget {
  @override
  pharmacy_pharmacyState createState() => pharmacy_pharmacyState();
}

class pharmacy_pharmacyState extends State<pharmacy> {
  List<Pharmacy> items = List();
  DatabaseHelperPhar db = new DatabaseHelperPhar();

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
                        margin: EdgeInsets.only(top: 10, right: 30, left: 30),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff6D6298),
                        ),
                      ),
                      /*  Container(
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text('${items[position].from}',),
                                        Text(' :البدء',
                                            //  textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            )),
                                      ],
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
                                      )),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 16.5, right: 88, left: 35),
                            padding: EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color(0xffd7d6e6)),
                          ),*/
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
                        EdgeInsets.only(top: 20, right: 30, left: 30),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffd7d6e6)
                        ),
                      ),
                      Padding(
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
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _createNewPharmacy(context);
        },
        backgroundColor: Color(0xff6D6298),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //  key: _bottomNavigationKey,
        //   index: 1,
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
