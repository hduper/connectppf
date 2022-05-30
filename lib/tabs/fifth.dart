import 'package:flutter/material.dart';
import 'package:connectppf/Screens/Login/login_screen.dart';
import 'package:connectppf/Screens/Signup/signup_screen.dart';
import 'package:connectppf/Screens/Welcome/components/background.dart';
import 'package:connectppf/components/rounded_button.dart';
import 'package:connectppf/constants.dart';
import 'package:connectppf/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:connectppf/components/color_loader_4.dart';
import 'package:connectppf/pages/camera_page.dart' ;
import 'package:connectppf/pages/chat_screen.dart' ;
import 'package:connectppf/pages/status_page.dart' ;
import 'package:connectppf/pages/call_history.dart' ;

class FifthTab extends StatefulWidget{
  @override
  FifthTabState createState() => FifthTabState();
}
class FifthTabState extends State<FifthTab> with SingleTickerProviderStateMixin {
  @override
  /*
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Chats",
                style: TextStyle(color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Quicksand'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } */
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = new TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
          appBar:
          new TabBar(
          controller: _tabcontroller,
          indicatorColor: Colors.black,
            unselectedLabelColor: Colors.lightBlue[105],
            labelColor: const Color(0xFF3baee7),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
          tabs: <Tab>[
            new Tab(text: 'CHATS',),
            new Tab(text: 'AUDIO CALLS',)
          ],
    ),
      body: new TabBarView(
        controller: _tabcontroller,
        children: <Widget>[
          new ChatScreen(),
          new CallHistory()

        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(Icons.message),
        onPressed: (() => print('Hello')),
      ),
    );
  }

}
