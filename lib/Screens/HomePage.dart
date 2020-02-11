import 'package:birdies_scop/Screens/LogoutPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'Scoreboard/ScoreboardRule.dart';
import 'Settings.dart';
import 'UserProfile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _children = [UserProfile(), ScoreboardRule(), Settings(), Logout() ];
  int _currentIndex;


  @override
  void initState() {
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body :_children[_currentIndex],
        bottomNavigationBar: SizedBox(
          height: 55,
          child: BottomNavigationBar(
            currentIndex: 0,
            backgroundColor: Colors.white,
            elevation: 10,
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home, color: _currentIndex == 0 ? Colors.green : Colors.grey,),
                title: new Text('Home', style: TextStyle(color: _currentIndex == 0 ? Colors.green : Colors.grey,),),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.score, color: _currentIndex == 1 ? Colors.green : Colors.grey,),
                title: new Text('Scoreboard', style: TextStyle(color: _currentIndex == 1 ? Colors.green : Colors.grey,),),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.settings, color: _currentIndex == 2 ? Colors.green : Colors.grey,),
                title: new Text('Settings', style: TextStyle(color: _currentIndex == 2 ? Colors.green : Colors.grey,),),
              ),

              BottomNavigationBarItem(
                icon: new Icon(Icons.exit_to_app, color: _currentIndex == 2 ? Colors.green : Colors.grey,),
                title: new Text('Logout', style: TextStyle(color: _currentIndex == 2 ? Colors.green : Colors.grey,),),
              ),
            ],
            fixedColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      )
    );
  }
}

