import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_app_mab/model/laboratory.dart';
import 'package:flutter_app_mab/ui/AddLab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/utils/database_helper.dart';
import 'home_page.dart';
import 'logIn.dart';
import 'package:google_fonts/google_fonts.dart';

class laboratory extends StatefulWidget {
  @override
  laboratory_laboratoryState createState() => laboratory_laboratoryState();
}

class laboratory_laboratoryState extends State<laboratory> {
  List<Laboratory> items = List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();
    db.getAllLaboratorys().then((laboratorys){
      setState(() {
        laboratorys.forEach((laboratory){
          items.add(Laboratory.fromMap(laboratory));
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
      body: Column(
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
                              Image.asset('assets/Image/blood.ico'),
                            ],
                          ),
                          margin: EdgeInsets.only(top: 10, right: 30, left: 30),
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
                                onPressed: () => _navigateToLaortory(
                                    context, items[position]),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Color(0xff6D6298),
                                  ),
                                  onPressed: () => _deleteLabortory(
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
          _createNewLabortory(context);
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

  _deleteLabortory(
      BuildContext context, Laboratory laboratory, int position) async {
    db.deleteLaboratory(laboratory.id).then((laboratorys) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToLaortory(BuildContext context, Laboratory laboratory) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddLab(laboratory)),
    );

    if (result == 'update') {
      db.getAllLaboratorys().then((laboratorys) {
        setState(() {
          items.clear();
          laboratorys.forEach((laboratory) {
            items.add(Laboratory.fromMap(laboratory));
          });
        });
      });
    }
  }

  void _createNewLabortory(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddLab(Laboratory('', '', '', '', ''))),
    );

    if (result == 'save') {
      db.getAllLaboratorys().then((laboratorys) {
        setState(() {
          items.clear();
          laboratorys.forEach((laboratory) {
            items.add(Laboratory.fromMap(laboratory));
          });
        });
      });
    }
  }
}
