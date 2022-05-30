import 'package:flutter/material.dart';
import 'package:connectppf/components/text_field_container.dart';
import 'package:connectppf/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';


class RoundedPasswordField extends StatefulWidget{
  final ValueChanged<String> onChanged;
  RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }
  @override
  RoundedPasswordFieldState createState() => RoundedPasswordFieldState();
}

class RoundedPasswordFieldState extends State<RoundedPasswordField> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color(0xff29b6f6),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
          validator: MultiValidator([
            RequiredValidator(errorText: "* Required"),
            MinLengthValidator(6,
                errorText: "Password should be atleast 6 characters"),
            MaxLengthValidator(15,
                errorText:
                "Password should not be greater than 15 characters")
          ])
      ),
    );
  }
}
