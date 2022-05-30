import 'package:flutter/material.dart';
import 'package:connectppf/components/text_field_container.dart';
import 'package:connectppf/constants.dart';
import 'package:connectppf/components/rounded_password_field.dart';

class RoundedPasswordFieldConfirm extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordFieldConfirm({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Confirm Password",
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
      ),
    );
  }
}
