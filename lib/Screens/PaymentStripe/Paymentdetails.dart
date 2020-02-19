import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class Payment_Details extends StatefulWidget {


  @override
  _Payment_DetailsState createState() => _Payment_DetailsState();
}

class _Payment_DetailsState extends State<Payment_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Image.asset('assets/images/blackcover.jpg'),
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
                             Container(
                               width:500 ,
                               height: 50,
                               child: Card(
                                 color: Colors.blue,

                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10)
                                 ),

                                 child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: <Widget>[


                                   ],
                                 ),
                               ),
                             )
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

    )
    );

  }
}
