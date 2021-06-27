//import 'package:d_details_ui/Screens/home_page.dart';
import 'package:flutter_app_mab/ui/home_page.dart';
import 'package:flutter_app_mab/ui/logIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mab/ui/skip.dart';
import 'package:flutter_app_mab/ui/temp.dart';

import 'model/user.dart';
//import 'package:parse_server_sdk/parse_server_sdk.dart';


// I'm Rawan

void main() async {
  /// first is AppID
  /// then server
  /*await Parse().initialize("WNnA19JQ00UCVQibYEJo7wT2p6WQwNcUQc6swKyU",
      "https://parseapi.back4app.com",
      clientKey: "VWeYuXo7PpLv9A9uk2HXvC47yESoGGhc2gPHccs3");*/

 /* var apiResponse = await ParseObject('Doctors').getAll();
  if (apiResponse.success) {
    for (var testObject in apiResponse.result) {
      print(testObject.toString());
    }
  }*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  User user;
  Future<void> _getUser() async {
    user = _getUser() as User;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
       // home: Temp(),
      routes: {
        '/': (context) => user == null ? Skip() : LoginScreen(),
        '/login': (BuildContext context) => new LoginScreen(),
        '/home': (BuildContext context) => new Home(''),
        //'/register': (BuildContext context) => new RegisterPage(),
      //  '/': (BuildContext context) => new LoginScreen(),
      }
    );
  }
}

