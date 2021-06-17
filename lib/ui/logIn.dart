import 'package:flutter/material.dart';
import 'package:flutter_app_mab/model/user.dart';
import 'package:flutter_app_mab/ui/login_presenter.dart';
import 'package:flutter_app_mab/utils/database_helperUser.dart';

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
                        padding: const EdgeInsets.only(right: 40.0, top: 160),
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
                            onSaved: (val) => _Number = val,
                            cursorColor: Color(0xff4d36ad),
                            decoration: InputDecoration(
                              icon: Icon(Icons.assignment_turned_in_sharp,
                                  color: Color(0xff4d36ad)),
                              hintText: 'رقم النقابي',
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
                            onSaved: (val) => _password = val,
                            cursorColor: Color(0xff4d36ad),
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Color(0xff4d36ad),
                              ),
                              hintText: 'كلمة السر',
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
                              'تسجيل الدخول',
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
                        onPressed: () {/*forgot password screen*/},
                        textColor: Color(0xff4d36ad),
                        child: Text(
                          'نسيت كلمة المرور ؟',
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: Text(
                              'أهلاً وسهلاً',
                              style: TextStyle(
                                  color: Color(0xff4d36ad),
                                  // fontWeight: FontWeight.bold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 40.0, top: 120),
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
                                onSaved: (val) => _NumberS = val,
                                cursorColor: Color(0xff4d36ad),
                                decoration: InputDecoration(
                                  icon: Icon(Icons.assignment_turned_in_sharp,
                                      color: Color(0xff4d36ad)),
                                  hintText: 'رقم النقابي',
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
                                onSaved: (val) => _UserName = val,
                                cursorColor: Color(0xff4d36ad),
                                decoration: InputDecoration(
                                  icon: Icon(Icons.person_pin,
                                      color: Color(0xff4d36ad)),
                                  hintText: 'اسم المستخدم',
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
                                onSaved: (val) => _passwordS = val,
                                cursorColor: Color(0xff4d36ad),
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock,
                                    color: Color(0xff4d36ad),
                                  ),
                                  hintText: 'كلمة السر',
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
                                  'إنشاء حساب',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              onTap: (){
                                final form = formKeyS.currentState;
                                if (form.validate()) {
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
            'ليس لديك حساب؟ أنشىء حساب',
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
    _showSnackBar("Login not successful");
    setState(() {
      _isLoadingL = false;
    });
  }

  @override
  void onLoginSuccess(User user) {
    if(user.username == ""){
      _showSnackBar("Login not successful");
    }else{
      _showSnackBar(user.toString());
    }
    setState(() {
      _isLoadingL = false;
    });
    if(user.flaglogged == "logged"){
      print("Logged");
      Navigator.of(context).pushNamed("/home");
    }else{
      print("Not Logged");
    }
  }
}
