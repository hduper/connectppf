import 'package:flutter/material.dart';
import 'package:connectppf/Screens/Login/login_screen.dart';
import 'package:connectppf/Screens/Signup/signup_screen.dart';
import 'package:connectppf/Screens/Welcome/components/background.dart';
import 'package:connectppf/components/rounded_button.dart';
import 'package:connectppf/constants.dart';
import 'package:connectppf/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/components/color_loader_4.dart';
import 'package:connectppf/components/dialog.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter/services.dart';
class FirstTab extends StatelessWidget {
  static const platform = const MethodChannel("com.flutter.epic/epic");
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
                "Remotely Control a Device",
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
                  Printy();
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
  void Printy() async {
    String value;
    try{
      value = await platform.invokeMethod("Printy");
    } catch (e){
      print(e);
    }

    print(value);
  }
}

