import 'package:connectppf/screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/Screens/Login/login_screen.dart';
import 'package:connectppf/Screens/Signup/signup_screen.dart';
import 'package:connectppf/Screens/Welcome/components/background.dart';
import 'package:connectppf/components/rounded_button.dart';
import 'package:connectppf/constants.dart';
import 'package:connectppf/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/components/color_loader_4.dart';
import 'package:connectppf/tabs/first.dart';
import 'package:connectppf/Screens/Login/login_screen.dart';



class SixthTab extends StatefulWidget{
  final int logincheck;

  const SixthTab ({Key key, this.logincheck}): super(key: key);
  @override
  _SixthTabState createState() => _SixthTabState();
}
class _SixthTabState extends State<SixthTab>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Manage User Account",
                style: TextStyle(color: Colors.black),
              ),
              FloatingActionButton(
                onPressed: () {  },
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.account_circle,
                  color: Colors.black87,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
