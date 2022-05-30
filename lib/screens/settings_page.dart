import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:connectppf/screens/account_page.dart';
import 'package:connectppf/screens/header_page.dart';
import 'package:connectppf/utils/constants.dart';
import 'package:connectppf/widgets/darkMode.dart';
import 'package:connectppf/widgets/delete.dart';
import 'package:connectppf/widgets/feedback.dart';
import 'package:connectppf/widgets/logout.dart';
import 'package:connectppf/widgets/reportbug.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topAppBar,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(padding),
            children: [
              HeaderPage(),
              const SizedBox(
                height: 16,
              ),
              SettingsGroup(title: 'General Settings', children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                DarkMode(),
                const SizedBox(
                  height: 16,
                ),
                AccountPage(),
                const SizedBox(
                  height: 16,
                ),
                buildLogout(),
                const SizedBox(
                  height: 16,
                ),
                buildDeleteAccount(),
                const SizedBox(
                  height: 16,
                ),
                buildReportBug(context),
                const SizedBox(
                  height: 16,
                ),
                buildSendFeedback(context),
              ]),
            ],
          ),
        ));
  }
}

//Creating AppBar function
final topAppBar = AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  title: const Text(
    "Settings",
    style: TextStyle(
        letterSpacing: 2,
        color: colorSchema,
        fontSize: 30,
        fontWeight: FontWeight.bold),
  ),
  leading: const BackButton(color: colorSchema),
);
