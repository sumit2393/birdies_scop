import 'package:flutter/material.dart';
 class BeginGame extends StatefulWidget {
   @override
   _BeginGameState createState() => _BeginGameState();
 }
 
 class _BeginGameState extends State<BeginGame> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: true,
       home: Scaffold(
         body: SafeArea(
           child: SingleChildScrollView(
             child: Column(
               children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
               height: 240,
               width: MediaQuery.of(context).size.width,
               child: Image.asset(
                 "assets/images/bg.jpg",
                 fit: BoxFit.fill,
               ),

                )
              ],
            )
               ],
             ),
           ),
         ),
       ),


     );
   }
 }
