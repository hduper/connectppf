import 'package:flutter/material.dart';
import 'package:connectppf/Screens/Login/login_screen.dart';
import 'package:connectppf/Screens/Signup/signup_screen.dart';
import 'package:connectppf/Screens/Welcome/components/background.dart';
import 'package:connectppf/components/rounded_button.dart';
import 'package:connectppf/constants.dart';
import 'package:connectppf/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/components/color_loader_4.dart';
import 'package:connectppf/buttons/simple_round_only_icon_button.dart';
class FourthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SimpleRoundOnlyIconButton();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Contacts",
                style: TextStyle(color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Quicksand'
                ),
              ),
              FloatingActionButton(
                onPressed: () {  },
                backgroundColor: Colors.blueAccent[600],
                child: Icon(
                  Icons.add,
                  color: Colors.black87,
                  size: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
