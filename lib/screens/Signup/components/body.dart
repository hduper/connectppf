import 'package:flutter/material.dart';
import 'package:connectppf/Screens/Login/login_screen.dart';
import 'package:connectppf/Screens/Signup/components/background.dart';
import 'package:connectppf/Screens/Signup/components/or_divider.dart';
import 'package:connectppf/Screens/Signup/components/social_icon.dart';
import 'package:connectppf/components/already_have_an_account_acheck.dart';
import 'package:connectppf/components/rounded_button.dart';
import 'package:connectppf/components/rounded_input_field.dart';
import 'package:connectppf/components/rounded_password_field.dart';
import 'package:connectppf/components/rounded_password_field_confirm.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_svg/svg.dart';
class Body extends StatefulWidget{
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {
  final RoundedPasswordField check= new RoundedPasswordField();
  static var temp;
  String _usernameError;
  String _passwordError;
  validate() {
    if (!validateStructure(temp)) {
      setState(() {
        _usernameError = 'emailError';
        _passwordError = 'passwordError';
      });
      showDialog(context: context, builder: (context) {
        return new SimpleDialog(
            children: <Widget>[
              new Center(child: new Container(child: new Text('Invalid password format')))
            ]);
      }
      );
        return 0;
    }
  }
  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Quicksand'),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/icons/signup.jpg",
              height: size.height * 0.18,
            ),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                temp=value;
              },
            ),
            RoundedPasswordFieldConfirm(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                if (validate() == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
