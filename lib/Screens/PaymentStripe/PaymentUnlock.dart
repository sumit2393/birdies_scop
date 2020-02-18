import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

import 'AddCard.dart';

class Payment_Unlock extends StatefulWidget {
  @override
  _Payment_UnlockState createState() => _Payment_UnlockState();
}

class _Payment_UnlockState extends State<Payment_Unlock> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body:SafeArea(
          child: Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                height:250,
                                child: Image.asset('assets/images/blackcover.jpg')
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(padding: EdgeInsets.all(2),child: Text("Payment details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                                  Container(padding: EdgeInsets.all(2),child: Text("Please double check & confirm that all the information displayed is accurate", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey, ),)),
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          height: 50,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              shape: BoxShape.rectangle,
                                              color: Colors.brown
                                          ),
                                          child: Center(child: Text("\$4.00", style: TextStyle(color:Colors.white, fontSize: 16))),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context).size.width*0.6,
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text("will be deducted from the card selected below",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey, ),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(padding: EdgeInsets.all(2),child: Text("No cards saved, add one", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                                  Container(padding: EdgeInsets.all(2),child: Text("In order to purchase courses, you nedd to add a payment method to your accout", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey, ),)),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      child: DottedBorder(
                                        radius: Radius.circular(100.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.add_circle_outline),
                                            FlatButton(
                                              child: Text(
                                                "ADD A CREDIT CARD",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal),
                                              ),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    isScrollControlled:true,
                                                    context: context,
                                                    builder: (context){
                                                      return FractionallySizedBox(
                                                        heightFactor: 0.75,
                                                        child: AddCard(),
                                                      );
                                                    }
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 215, right: 10),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(color: Colors.green,
                      gradient: LinearGradient(colors: [Color(0xff05c39b),Colors.green]),
                    ),
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.bottomCenter,
                    child: SliderButton(
                      action: () {
                        ///Do something here after slide
                      },
                      width: MediaQuery.of(context).size.width,
                      label: Text(
                        "Slide to confirm & pay ->" ,
                        style: TextStyle(
                            color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      icon: Center(child: Icon(Icons.transfer_within_a_station,color: Colors.white)),
                      backgroundColor: Color(0xff05c39b),
                      buttonColor: Color(0xff05c39b),
                      baseColor: Colors.white,
                    ),
                  ),
                ],
          ) ,
          ),
        ),
    );

  }
}
