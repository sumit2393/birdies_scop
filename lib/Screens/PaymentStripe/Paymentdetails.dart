//import 'package:birdies_scop/Screens/PaymentStripe/PaymentWithCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
import 'package:slider_button/slider_button.dart';
import 'package:stripe_payment/stripe_payment.dart';

//import 'flutter_stripe_payment.dart';

class Payment_Details extends StatefulWidget {
  @override
  _Payment_DetailsState createState() => _Payment_DetailsState();
}

class _Payment_DetailsState extends State<Payment_Details> {
  List<String> cardsList;
  List<String> cardNumbersList;
  List<String> cardExpiresList;
  List<String> cardNamesList;


  // Stripe payment
  String _paymentMethodId;
  String _errorMessage = "";
  final _stripePayment = FlutterStripePayment();

  double amount = 0.50;


  @override
  initState(){
    super.initState();

    cardsList = ["Chase Unlimited","Swift Life","Excess One"];
    cardNumbersList = ["121645454654","6874687687465","654864654654"];
    cardExpiresList = ["11/22","02/25","09/35"];
    cardNamesList = ["Chris Arok", "Hanna M", "Freeman"];

    // stripe payment

    _stripePayment.setStripeSettings("pk_test_ifyKDeYk6BosOqgp67qjvWBC00Wu3Ykj2q" );
    _stripePayment.onCancel = () {
      print("the payment form was cancelled");
    };




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:SafeArea(
      child: SingleChildScrollView(
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
                                 width: MediaQuery.of(context).size.width,
                                 height: 140,
                                 child: ListView.builder(
                                   itemCount: cardsList.length,
                                     shrinkWrap: true,
                                     scrollDirection: Axis.horizontal,
                                     itemBuilder: (context,index){
                                       return Container(
                                         width: 300,
                                         padding: EdgeInsets.all(15),
                                         margin: EdgeInsets.all(10),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.all(Radius.circular(10)),
                                           color: Colors.blue,
                                         ),

                                         child: Container(
                                           child: Column(

                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[



                                               Container(
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children: <Widget>[
                                                     Text(cardsList[index].toString(), style: TextStyle(color:Colors.white, fontSize: 15,letterSpacing: 1.0),),
                                                     CircleAvatar(
                                                       child: Icon(Icons.edit,color: Colors.white,),
                                                       backgroundColor: Colors.grey,
                                                       radius: 20,
                                                     ),

                                                   ],
                                                 ),
                                               ),


                                               Container(

                                                   child: Text(cardNumbersList[index].toString(), style: TextStyle(color:Colors.white),)

                                               ),
                                               Container( padding:EdgeInsets.only(top: 2,),child: Text("Expires "+cardExpiresList[index].toString(), style: TextStyle(color:Colors.white),)),
                                               Container(child: Text(cardNamesList[index].toString(), style: TextStyle(color:Colors.white),)),
                                             ],
                                           ),
                                         ),
                                       );
                                     }
                                 ),
                               ),

                                _paymentMethodId != null
                                    ?
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  child: FutureBuilder(
                                    future: _stripePayment.confirmPaymentIntent("sk_test_RtbOP8zPOkzBom43uRLp3wjA00vRlq2Dy8", _paymentMethodId, amount),
                                    builder: (context, res){

                                      if(res.hasData && res.connectionState==ConnectionState.active) {
                                        String response = res.data;

                                        return Text("Response: " + response);
                                      }
                                      else if(res.hasError){
                                        return Text("Response: " + res.error.toString());
                                      }else{
                                        return Container();
                                      }

                                    },

                                  ),
                                )
                                    :
                                Container(
                                  child: Text(_errorMessage),
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
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(color: Colors.green,
                  gradient: LinearGradient(colors: [Color(0xff05c39b),Colors.green]),
                ),
                padding: EdgeInsets.all(16),
                alignment: Alignment.bottomCenter,
                child: SliderButton(
                  action: () async {
                    ///Do something here after slide

                    var paymentResponse = await _stripePayment.addPaymentMethod();
                    setState(() {
                      if (paymentResponse.status ==
                          PaymentResponseStatus.succeeded) {
                        _paymentMethodId = paymentResponse.paymentMethodId;
                      } else {
                        _errorMessage = paymentResponse.errorMessage;
                      }
                    });

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
    )
    );
  }
}
