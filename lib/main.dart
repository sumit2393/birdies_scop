import 'package:birdies_scop/Screens/Settings.dart';
import 'package:birdies_scop/Screens/SettingsTabs/SettingsMyProfile.dart';
import 'package:flutter/material.dart';
import 'Screens/Scoreboard/ScoreboardEdit.dart';
import 'Screens/Scoreboard/ScoreboardRule.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //
        home: ScoreboardRule()
    );
  }
}
