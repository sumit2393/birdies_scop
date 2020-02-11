import 'package:birdies_scop/Screens/HomePage.dart';
import 'package:birdies_scop/Screens/Registration.dart';
import 'package:birdies_scop/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email, password;
  bool hidePass;
  Icon passIcon;

  @override
  void initState() {
  email="";
  password="";
  hidePass = true;
  passIcon = Icon(hidePass == true ? Icons.visibility : Icons.visibility_off);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    child: Image.asset(
                      'assets/images/birdbg.png', fit: BoxFit.cover, height: 450,)
                ),
                Container(
                  margin: EdgeInsets.only(top: 390, left:15,right: 15),
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF7adbae),
                      style: BorderStyle.solid,
                      width: 3.5,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return Registration();
                        }));
                      },
                      child: Text(
                        "CREATE AN ACCOUNT",
                        style: TextStyle(
                          color: Color(0xFFffffff),
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Container(
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
                                hintText: 'User Name',
                                prefixIcon: Icon(Icons.person_pin),
                              ),
                              onChanged: (input) {
                                setState(() {
                                  email = input;
                                });
                              },
                            ),
                          ),

                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            obscureText: hidePass,
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
                              suffixIcon: GestureDetector(
                                child: passIcon,
                                onTap: (){
                                  setState(() {
                                    hidePass = !hidePass;
                                    passIcon = Icon(hidePass == true ? Icons.visibility : Icons.visibility_off);
                                  });
                                },
                              )
                            ),
                            onChanged: (input) {
                              setState(() {
                                password = input;
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
                                child: Text("Sign in to My Account",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                            ),
                            onPressed: () {
                              
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email,
                                  password: password
                              ).then((value) =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) {
                                        return HomePage();
                                      }))
                              ).catchError((error){

                                Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(error.toString()),
                                    )
                                );

                              });
                            },
                            padding: EdgeInsets.all(20),
                            color: Colors.transparent,
                          ),
                        )
                      ],
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}