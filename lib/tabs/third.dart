import 'package:connectppf/screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/Screens/Login/login_screen.dart';
import 'package:connectppf/Screens/Signup/signup_screen.dart';
import 'package:connectppf/Screens/Welcome/components/background.dart';
import 'package:connectppf/components/rounded_button.dart';
import 'package:connectppf/constants.dart';
import 'package:connectppf/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/components/color_loader_4.dart';
class ThirdTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30,),
              Text(
                "Screen Sharing",
                style: TextStyle(color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Quicksand'
                ),
              ),
              SizedBox(height: 30,),
              RoundedInputField(
                hintText: "Enter Your Partner's ID",
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "CONNECT",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorLoader4()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
