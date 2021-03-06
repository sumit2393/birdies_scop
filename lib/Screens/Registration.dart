import 'dart:io';
import 'package:birdies_scop/Screens/HomePage.dart';
import 'package:birdies_scop/Screens/Login.dart';
import 'package:birdies_scop/Screens/UserProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../main.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  ProgressDialog pr;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String email, name, handicap, starting_position, password, repeat_password;

  TextEditingController emailEditingContrller;
  TextEditingController nameEditingController;
  TextEditingController handicapEditingController;
  TextEditingController starting_posEditingController;
  TextEditingController passwordEditingController;
  TextEditingController repeat_pas_EditingController;

  File _image;


  @override
  void initState() {
    super.initState();


    emailEditingContrller = TextEditingController();
    nameEditingController = TextEditingController();
    handicapEditingController = TextEditingController();
    starting_posEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    repeat_pas_EditingController = TextEditingController();

    email = "";
    name = "";
    handicap = "";
    starting_position = "";
    password = "";
    repeat_password = "";
  }


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Waiting...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );

    return Scaffold(
        resizeToAvoidBottomInset: true, // set it to false
        appBar: null,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                  child: Image.asset(
                    'assets/images/birdbg.png', fit: BoxFit.cover, height: 300,)
              ),
              SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[


                        Container(
                          child: Padding(
                            child: Text(
                                "Create a new Account", style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start),
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: emailEditingContrller,
                            //   validator:emailValidator,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Color(0xFFF3F7F6),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              hintText: 'Email (used for login)',
                              prefixIcon: Icon(Icons.person),
                            ),
                            onChanged: (input) {
                              setState(() {
                                email = input;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Color(0xFFF3F7F6),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              hintText: 'Name',
                              prefixIcon: Icon(Icons.person_pin),
                            ),
                            onChanged: (input) {
                              setState(() {
                                name = input;
                              });
                            },
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: GestureDetector(
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            image: DecorationImage(
                                                image: _image == null
                                                    ? AssetImage(
                                                    "assets/images/profile_photo.png")
                                                    : FileImage(_image),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                        onTap: getImage,
                                      )
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(15),
                                            filled: true,
                                            fillColor: Color(0xFFF3F7F6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.black12),
                                            ),
                                            hintText: 'Handicap',
                                            prefixIcon: Icon(Icons.flag),
                                          ),
                                          onChanged: (input) {
                                            setState(() {
                                              handicap = input;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(15),
                                            filled: true,
                                            fillColor: Color(0xFFF3F7F6),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.black12),
                                            ),
                                            hintText: 'Starting position',
                                            prefixIcon: Icon(Icons.adjust),
                                          ),
                                          onChanged: (input) {
                                            setState(() {
                                              starting_position = input;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: passwordEditingController,
                            // validator: pwdValidator,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Color(0xFFF3F7F6),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline),
                            ),
                            onChanged: (input) {
                              setState(() {
                                password = input;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Color(0xFFF3F7F6),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              hintText: 'Repeat Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (input) {
                              setState(() {
                                repeat_password = input;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF1EE07C),
                                    Color(0xFF21C4A7),
                                  ],
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter
                              )
                          ),


                          child: FlatButton(
                            child: Center(
                                child: Text("CREATE ACCOUNT", style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                            ),


                            onPressed: () {
                              pr.show();
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: email.toLowerCase().trim(),
                                  password: password).then((currentUser) {
                                Map<String, dynamic> userMap = new Map();
                                userMap.putIfAbsent("email", () => email);
                                userMap.putIfAbsent("handicap", () => handicap);
                                userMap.putIfAbsent("name", () => name);
                                userMap.putIfAbsent("starting_position", () => starting_position);

                                Firestore.instance.collection("user").document(currentUser.user.uid).setData(userMap).whenComplete(() {
                                  pr.hide();

                                  print("Logged In");

                                  return Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return HomePage();
                                      }));
                                }).catchError((error) {
                                  pr.hide();
                                  print("ErrorPrint2: " + error.toString());
                                });
                              }).catchError((error) {
                                pr.hide();
                                print("ErrorPrint1: " + error.toString());
                              });
                            },
                            padding: EdgeInsets.all(20),
                            color: Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }

}