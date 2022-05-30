import 'package:flutter/material.dart';
import 'package:connectppf/Screens/Login/login_screen.dart';
import 'package:connectppf/Screens/Signup/signup_screen.dart';
import 'package:connectppf/Screens/Welcome/components/background.dart';
import 'package:connectppf/components/rounded_button.dart';
import 'package:connectppf/constants.dart';
import 'package:connectppf/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/components/color_loader_4.dart';
import 'package:flutter/services.dart';
class SecondTab extends StatelessWidget {
  static const platform = const MethodChannel("com.flutter.ftp/ftp");
  void Printy() async {
    String value;
    try{
      value = await platform.invokeMethod("Printy");
    } catch (e){
      print(e);
    }

    print(value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  /*
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
                "File Transfer Access",
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
  } */
}
