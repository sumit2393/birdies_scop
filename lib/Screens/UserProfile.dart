import 'dart:io';

import 'package:birdies_scop/Screens/Registration.dart';
import 'package:flutter/material.dart';
import '../Screens/MyProfileTabs//Unlocked.dart';
import '../Screens/MyProfileTabs/PastGames.dart';
import '../Screens/MyProfileTabs/MyStats.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var _currentTabPage;
  File _image;

  @override
  void initState() {
    setState(() {
      _currentTabPage = Unlocked();
    });
  }

  Future getImage(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Camera",
                    style: TextStyle(fontSize: 26),
                  ),
                  onPressed: () async {
                    var image =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    setState(() {
                      _image = image;
                      Navigator.pop(context);
                    });
                  },
                ),
                FlatButton(
                  child: Text(
                    "Gallery",
                    style: TextStyle(fontSize: 26),
                  ),
                  onPressed: () async {
                    var image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      _image = image;
                      Navigator.pop(context);
                    });
                  },
                ),
                _image != null
                    ? FlatButton(
                        child: Text(
                          "Remove Profile",
                          style: TextStyle(fontSize: 26),
                        ),
                        onPressed: () async {
                          setState(() {
                            _image = null;
                            Navigator.pop(context);
                          });
                        },
                      )
                    : Text("",),
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 20),
                    child:
                        CircleButton(iconData: Icons.arrow_back, onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return Registration();
                          }));
                        }),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50, top: 20),
                    height: 100,
                    width: 100,
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: _image != null
                            ? FileImage(_image)
                            : AssetImage('assets/images/profile_photo.png'),
                      ),
                      onTap: () {
                        getImage(context);
                      },
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20, right: 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/profile_photo.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text("Temp",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text("75'",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/profile_photo.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text("Wind",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text("24mph",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ))
                ],
              ),
            ),
            Container(
              alignment: FractionalOffset(0.0, 0.0),
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "My Profile",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: TabBar(
                    tabs: [
                      Tab(text: "Unlocked"),
                      Tab(text: "Past games"),
                      Tab(text: "My stats")
                    ],
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.green,
                    indicatorColor: Colors.green,
                    isScrollable: true,
                    onTap: (pos) {
                      setState(() {
                        if (pos == 0) {
                          _currentTabPage = Unlocked();
                        } else if (pos == 1) {
                          _currentTabPage = PastGames();
                        } else if (pos == 2) {
                          _currentTabPage = MyStats();
                        }
                      });
                    },
                  )),
            ),
            Expanded(
              child: _currentTabPage,
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
