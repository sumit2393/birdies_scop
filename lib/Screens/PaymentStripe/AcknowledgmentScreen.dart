import 'package:flutter/material.dart';

class AcknowledgmentPayment extends StatefulWidget {

  @override
  _AcknowledgmentPaymentState createState() => _AcknowledgmentPaymentState();
}

class _AcknowledgmentPaymentState extends State<AcknowledgmentPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child:Container(
         child: Column(

           children: <Widget>[

             Container(
               child: Stack(
                 children: <Widget>[

                   Container(
                     height:250,
                     child: Image.asset('assets/images/blackcover.jpg'),

                   ),
                   Column(
                     children: <Widget>[
                       Container(
                         margin: EdgeInsets.only(top:20,left: 100),
                         child: RichText(
                           text: TextSpan(
                               children: <TextSpan>
                               [
                                 TextSpan(text: 'You Unlocked', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ,fontSize: 20)),
                               ]

                           ),
                         ),

                       ),
                       Container(
                         margin: EdgeInsets.only(top:20,left: 100),
                         child: RichText(
                           text: TextSpan(

                               children: <TextSpan>
                               [
                                 TextSpan(text: 'Pebble Beach', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ,fontSize: 30)),
                               ]

                           ),
                         ),
                       ),

                       Container(
                         margin: EdgeInsets.only(top:10,left: 100),
                         child: RichText(
                           text: TextSpan(

                               children: <TextSpan>
                               [
                                 TextSpan(text: 'Santa Cruz CA-18 holes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ,fontSize: 13)),
                               ]

                           ),
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(top:25,left: 100),
                         child: RichText(
                           text: TextSpan(

                               children: <TextSpan>
                               [
                                 TextSpan(text: 'About unlocking course', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white ,fontSize: 15)),
                               ]

                           ),
                         ),
                       ),
                     ],
                   ),
                   Column(
                     children: <Widget>[
                       Container(
                         margin: EdgeInsets.only(top:250,),
                       child: CircleAvatar(
                         child: Icon(Icons.check_circle,color: Colors.greenAccent,),
                         backgroundColor: Colors.white,
                         radius: 50,
                       ),
                       ),
                       Container(
                         margin: EdgeInsets.only(top: 200,bottom: 0,right: 20,left: 20),
                         decoration: BoxDecoration(
                             borderRadius: new BorderRadius.circular(10.0),
                             gradient: LinearGradient(
                                 colors: [Color(0xFF1EE07C),Color(0xFF21C4A7),],
                                 begin: FractionalOffset.topCenter,
                                 end: FractionalOffset.bottomCenter
                             )
                         ),
                         child: FlatButton(
                           child: Center(
                               child: Text("Return to Course Summary",style: TextStyle(color: Colors.white,fontSize: 16))
                           ),
                           onPressed: (){},
                           padding: EdgeInsets.all(20),
                           color: Colors.transparent,
                         ),
                       ),
                     ],
                   ),

                   Container(
                     alignment: Alignment.centerRight,
                     margin: EdgeInsets.only(top:215, right:10),
                     child: GestureDetector(
                       child: CircleAvatar(
                         backgroundColor: Colors.white,
                         radius: 25,
                         child: Icon(
                           Icons.close,
                           color: Colors.black,
                       ),

                     ),
                       onTap: ()
                       {
                         Navigator.pop(context);
                       },
                   )
                   )],
               ),
             ),



           ],
         ),


         )

       ),
    );
  }
}
