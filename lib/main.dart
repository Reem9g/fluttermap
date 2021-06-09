//import 'package:d_details_ui/Screens/home_page.dart';
import 'package:flutter_app_mab/ui/logIn.dart';
import 'package:flutter/material.dart';
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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}

