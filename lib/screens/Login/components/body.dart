import 'package:connectppf/main.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/Screens/Login/components/background.dart';
import 'package:connectppf/Screens/Signup/signup_screen.dart';
import 'package:connectppf/components/already_have_an_account_acheck.dart';
import 'package:connectppf/components/rounded_button.dart';
import 'package:connectppf/components/rounded_input_field.dart';
import 'package:connectppf/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);
  static String emailid;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Quicksand',
              letterSpacing: 2.0),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/icons/login.jpg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                  emailid=value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHome()),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) {
                  return SignUpScreen();
                },
                ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
