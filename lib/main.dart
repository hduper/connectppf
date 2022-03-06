import 'package:connectppf/screens/Welcome/welcome_screen.dart';
import 'package:connectppf/tabs/fifth.dart';
import 'package:connectppf/tabs/fourth.dart';
import 'package:connectppf/tabs/sixth.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/constants.dart';
import 'package:connectppf/tabs/first.dart';
import 'package:connectppf/tabs/second.dart';
import 'package:connectppf/tabs/third.dart';
import 'package:connectppf/buttons/simple_round_only_icon_button.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connect++',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Image.asset(
          "assets/images/Logo_icon.png",
          fit: BoxFit.cover,
          height:30
        ),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[FirstTab(), SecondTab(), ThirdTab(), FourthTab(), FifthTab(), SixthTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.lightBlue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Image.asset(
                "assets/images/remoted.png",
                width: 100,
                height: 100
              )
            ),
            Tab(
              icon: Image.asset(
                  "assets/images/filet.png",
                  width: 100,
                  height: 100
              )
            ),
            Tab(
              icon: Image.asset(
                  "assets/images/meetings.png",
                  width: 100,
                  height: 100
              ),
            ),
            Tab(
              // set icon to the tab
              icon: Image.asset(
                  "assets/images/contacts.png",
                  width: 100,
                  height: 100
              )
            ),
            Tab(
              // set icon to the tab
              icon: Image.asset(
                  "assets/images/chat.png",
                  width: 100,
                  height: 100
              )
            ),
            Tab(
              // set icon to the tab
              icon: Image.asset(
                  "assets/images/user.png",
                  width: 100,
                  height: 100
              )
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
