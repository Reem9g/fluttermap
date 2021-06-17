import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app_mab/ui/mapScreen.dart';
import 'package:flutter_app_mab/ui/pharmacy.dart';
import 'package:flutter_app_mab/ui/laboratory.dart';
import 'package:flutter_app_mab/ui/center.dart';
import 'package:flutter_app_mab/ui/doctor.dart';
import 'logIn.dart';
import 'package:google_fonts/google_fonts.dart';

// Main Code
/*class Home extends StatefulWidget {
  @override
  Home_HomeState createState() => Home_HomeState();
}*/

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
List<String> images = [
  "assets/Image/labaratory.jpg",
  "assets/Image/pharmacy.jpg",
  "assets/Image/doctor.jpg",
  "assets/Image/center.jpg",
];

List<String> title = [
  "المخابر",
  "الصيدليات",
  "الأطباء",
  "المراكز",
];

/*class Home_HomeState extends State<Home> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff4d36ad),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff453097),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 100 - 63,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      primary: false,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: GestureDetector(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    for (int i = 0; i < Loc.length; i++)
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Loc[i]));
                                  },
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 40),
                                        child: CardScrollWidget(currentPage),
                                      ),
                                      Positioned.fill(
                                        child: PageView.builder(
                                          itemCount: images.length,
                                          controller: controller,
                                          reverse: true,
                                          itemBuilder: (context, index) {
                                            return Container();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //child: Image.asset("assets/image_02.jpg",
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 35),
                    child: Container(
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      // width: size.width * 0.8,
                      //  height: 50,
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        color: Color(0xffffffff).withAlpha(50),
                      ),
                      child: TextField(
                        cursorColor: Color(0xffffffff),
                        decoration: InputDecoration(
                          //  icon: Icon(Icons.search, color: Color(0xff6CECB3)),
                          hintText: 'بحث',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 230, top: 35),
                    child: Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white),
                        child: FlatButton(
                            onPressed: null,
                            child: Icon(
                              Icons.search,
                              color: Color(0xff453097),
                            ))),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff453097),
        iconSize: 30,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: const Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
              title: new Text(
                "خريطة",
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          new BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: new Text("الصفحة الرئيسية",
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          new BottomNavigationBarItem(
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
              title: new Text("تسجيل الخروج",
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}*/

/*class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 15.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}*/

class Home extends StatefulWidget {
  String UserName;
  Home(this.UserName);
  @override
  Home_HomeState createState() => Home_HomeState(this.UserName);
}

class Home_HomeState extends State<Home> {
  String UserName;
  Home_HomeState(this.UserName);
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
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 15, right: 50),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    topRight: Radius.circular(70)),
                color: Color(0xff4d36ad).withAlpha(75),
              ),
              child: ListTile(
                title: Text(
                  'المراكز',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                leading: Image.asset('assets/Image/hospital.png'),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => centerCards(UserName)));
            },
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 50),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    topLeft: Radius.circular(70)),
                gradient: LinearGradient(colors: [
                  Color(0xff4d36ad),
                  Color(0xff6D6298),
                ]),
              ),
              child: ListTile(
                title: Text(
                  'الأطباء',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                leading: Image.asset('assets/Image/doctor.ico'),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => D_details(UserName)));
            },
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 30, right: 50),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    topRight: Radius.circular(70)),
                color: Color(0xff4d36ad).withAlpha(75),
              ),
              child: ListTile(
                title: Text(
                  'الصيدليات',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                leading: Image.asset('assets/Image/pharmacy.ico'),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pharmacy(UserName)));
            },
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 50),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    topLeft: Radius.circular(70)),
                gradient: LinearGradient(colors: [
                  Color(0xff4d36ad),
                  Color(0xff6D6298),
                ]),
              ),
              child: ListTile(
                title: Text(
                  'المخابر',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                leading: Image.asset('assets/Image/blood.ico'),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => laboratory(UserName)));
            },
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //  key: _bottomNavigationKey,
        index: 2,
        height: 55.0,
        items: <Widget>[
          GestureDetector(
            child: Icon(Icons.stay_current_portrait, color: Colors.white, size: 30),
            // onTap: ,
          ),
          GestureDetector(
            child: Icon(Icons.location_pin, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => map()));
            },
          ),
          GestureDetector(
            child: Icon(Icons.home_outlined, color: Colors.white, size: 30),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home('')));
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

