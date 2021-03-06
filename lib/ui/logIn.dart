import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/ui/login_presenter.dart';
import 'package:flutter_app_mab/utils/database_helperUser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin
implements LoginPageContract{

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController nameRegController = TextEditingController();
  TextEditingController passwordRegController = TextEditingController();
  TextEditingController numRegController = TextEditingController();

  FocusNode f1 = new FocusNode();
  FocusNode f2 = new FocusNode();
  FocusNode f3 = new FocusNode();

  bool isLogin = true;
  Animation<double> contanerSize;
  AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  String _Number, _password,_NumberS, _passwordS,_UserName;

  bool _isLoadingS = false;
  final formKeyS = new GlobalKey<FormState>();
  final scaffoldKeyS = new GlobalKey<ScaffoldState>();


  bool _isLoadingL = false;
  final formKeyL = new GlobalKey<FormState>();
  final scaffoldKeyL = new GlobalKey<ScaffoldState>();
  LoginPagePresenter _presenter;
  _LoginScreenState() {
    _presenter = new LoginPagePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    // SystemChrome.set
    animationController = AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  void _showSnackBar(String text) {
    scaffoldKeyL.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }
  void _submit() {
    final form = formKeyL.currentState;

    if (form.validate()) {
      setState(() {
        _isLoadingL = true;
        form.save();
        _presenter.doLogin(_Number, _password);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);
    contanerSize = Tween(begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKeyL,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // on right
          Positioned(
              top: 95,
              right: -57,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  gradient: LinearGradient(
                    colors: [Color(0xff4d36ad).withAlpha(10), Color(0xff4d36ad)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                  //  color: Colors.lightBlueAccent
                ),
              )),
          Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [Color(0xffffffff), Color(0xffffffff)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                  //  color: Colors.lightBlueAccent
                ),
              )),
          // on left
          Positioned(
              top: -34,
              left: -38,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [Color(0xff4d36ad), Color(0xff4d36ad).withAlpha(100)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                  //  color: Colors.lightBlueAccent
                ),
              )),
          Positioned(
              top: -30,
              left: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [Color(0xffffffff), Color(0xffffffff)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                  //  color: Colors.lightBlueAccent
                ),
              )),
          // on buttom left
          Positioned(
              top:400.5,
              left: -28,
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [Color(0xff4d36ad), Color(0xff4d36ad).withAlpha(50)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                  //  color: Colors.lightBlueAccent
                ),
              )),
          Positioned(
              top: 401.5,
              left: -25,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [Color(0xffffffff), Color(0xffffffff)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                  //  color: Colors.lightBlueAccent
                ),
              )),
          // on buttom right
          Positioned(
              top: 460,
              right: -47,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  gradient: LinearGradient(
                    colors: [Color(0xff4d36ad).withAlpha(10), Color(0xff4d36ad)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                  //  color: Colors.lightBlueAccent
                ),
              )),
          Positioned(
              top: 465,
              right: -40,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [Color(0xffffffff), Color(0xffffffff)],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                  //  color: Colors.lightBlueAccent
                ),
              )),
          // cancel button
          AnimatedOpacity(
            opacity: isLogin ? 0.0 : 1.0,
            duration: animationDuration,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.1,
                alignment: Alignment.bottomCenter,
                child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: isLogin
                        ? null
                        : () {
                      animationController.reverse();
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    color: Color(0xff4d36ad)),
              ),
            ),
          ),

          // login form
        Form(
              key: formKeyL,
              child: AnimatedOpacity(
                duration: animationDuration * 4,
                opacity: isLogin ? 1.0 : 0.0,
                child:
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    child: ListView(
                      primary: false,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0, top: 120),
                          child: Container(
                            // margin: EdgeInsets.symmetric(vertical: 10),
                            padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            width: size.width * 0.8,
                            //  height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(55.0)),
                              color: Color(0xff4d36ad).withAlpha(50),
                            ),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: nameController,
                              onSaved: (val) => _Number = val,
                              cursorColor: Color(0xff4d36ad),
                              decoration: InputDecoration(
                                icon: Icon(Icons.assignment_turned_in_sharp,
                                    color: Color(0xff4d36ad)),
                                hintText: '?????? ????????????????',
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
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Container(
                            //margin: EdgeInsets.only(bottom: 0),
                            padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            width: size.width * 0.8,
                            //  height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(55.0)),
                              color: Color(0xff4d36ad).withAlpha(50),
                            ),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: passwordController,
                              onSaved: (val) => _password = val,
                              cursorColor: Color(0xff4d36ad),
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Color(0xff4d36ad),
                                ),
                                hintText: '???????? ????????',
                                hintStyle: TextStyle(
                                  color: Color(0xff4d36ad),
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
                                '?????????? ????????????',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          onTap: _submit,
                        ),
                        FlatButton(
                          onPressed: () {
                            showAlertDialog(context);
                            },
                          textColor: Color(0xff4d36ad),
                          child: Text(
                            '???????? ???????? ???????????? ??',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
  // register container
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              if (viewInset == 0 && isLogin) {
                return buildRegisterContainer();
              } else if (!isLogin) {
                return buildRegisterContainer();
              }
              return Container(
                height: size.height,
                width: size.width,
              );
            },
          ),
          // register form
          Form(
            key: formKeyS,
            child: AnimatedOpacity(
              duration: animationDuration * 5,
              opacity: isLogin ? 0.0 : 1.0,
              child: Visibility(
                visible: !isLogin,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    child: ListView(
                      primary: false,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              '?????????? ????????????',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff4d36ad),
                                  // fontWeight: FontWeight.bold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 40.0, top: 30),
                            child: Container(
                              // margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              width: size.width * 0.8,
                              //  height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(55.0)),
                                color: Color(0xff4d36ad).withAlpha(50),
                              ),
                              child: TextFormField(
                                focusNode: f1,
                                controller: numRegController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                onSaved: (val) => _NumberS = val,
                                cursorColor: Color(0xff4d36ad),
                                decoration: InputDecoration(
                                  icon: Icon(Icons.assignment_turned_in_sharp,
                                      color: Color(0xff4d36ad)),
                                  hintText: '?????? ??????????????',
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
                            padding: const EdgeInsets.only(
                              right: 40.0,
                            ),
                            child: Container(
                              // margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              width: size.width * 0.8,
                              child: TextFormField(
                                focusNode: f2,
                                controller: nameRegController,
                                textInputAction: TextInputAction.next,
                                onSaved: (val) => _UserName = val,
                                cursorColor: Color(0xff4d36ad),
                                decoration: InputDecoration(
                                  icon: Icon(Icons.person_pin,
                                      color: Color(0xff4d36ad)),
                                  hintText: '?????? ????????????????',
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
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Container(
                              //margin: EdgeInsets.only(bottom: 0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              width: size.width * 0.8,
                              //  height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(55.0)),
                                color: Color(0xff4d36ad).withAlpha(50),
                              ),
                              child: TextFormField(
                                focusNode: f3,
                                controller: passwordRegController,
                                textInputAction: TextInputAction.next,
                                onSaved: (val) => _passwordS = val,
                                cursorColor: Color(0xff4d36ad),
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock,
                                    color: Color(0xff4d36ad),
                                  ),
                                  hintText: '???????? ????????',
                                  hintStyle: TextStyle(
                                    color: Color(0xff4d36ad),
                                    // fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none,
                                  //   isCollapsed: true,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 80, right: 80, top: 20),
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff4d36ad),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                child: Text(
                                  '?????????? ????????',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              onTap: (){
                                final form = formKeyS.currentState;
                                if (form.validate() && nameRegController.text.isNotEmpty
                                && numRegController.text.isNotEmpty && passwordRegController.text.isNotEmpty) {
                                  setState(() {
                                    _isLoadingS = true;
                                    form.save();
                                    var user = new User(_NumberS, _UserName, _passwordS, null);
                                    var db = new DatabaseHelper();
                                    db.saveUser(user);
                                    _isLoadingS = false;
                                    Navigator.of(context).pushNamed("/login");
                                  });
                                }
                                else {
                                  _showSnackBar("?????????? ?????? ?????? ???????? ????????????????");
                                }
                               }
                            ),
                          ),
                        ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: contanerSize.value,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: Color(0xff4d36ad).withAlpha(30),
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
            animationController.forward();
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: isLogin
              ? Text(
            '?????? ???????? ?????????? ?????????? ????????',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff4d36ad), fontSize: 18),
          )
              : null,
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    _showSnackBar("?????????? ???????????? ?????? ?????????? ???????? ???????????? ???? ??????????????????");
    setState(() {
      _isLoadingL = false;
    });
  }

  @override
  void onLoginSuccess(User user) {
    if(user.username == ""){
      _showSnackBar("?????????? ???????????? ?????? ?????????? ???????? ???????????? ???? ??????????????????");
    }else{
      _showSnackBar(user.toString());
    }
    setState(() {
      _isLoadingL = false;
    });
    if(user.flaglogged == "logged"){
      print("Logged");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(builder: (_) => Home(nameController.text)),
              (Route<dynamic> route) => false
      );
    }else{
      print("Not Logged");
    }
  }


  _launchCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
String num ='0956532841';
  void showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("????"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      onPressed: () =>
          _launchCaller("tel:" + num),
      child: Text(
        '???????? ??????',
        style: GoogleFonts.lato(
            fontSize: 16, color: Colors.blue),
      ),
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("???? ???????? ???????? ???????? ??????????????"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
