import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../main.dart';

class ViewDroneMain extends StatefulWidget {
  @override
  _ViewDroneMainState createState() => _ViewDroneMainState();
}

class _ViewDroneMainState extends State<ViewDroneMain> {

  List<String> usersList;
  List<dynamic> counter;
  List<dynamic> usersScoresList;
  List<dynamic> parList;

  String selected_hole;

  @override
  void initState() {
    counter = [5, 5, 5, 5];
    usersList = ["Chris A.", "Hanna M.", "John D."];
    usersScoresList = [
      [5, 3, 1, 5],
      [4, 2, 2, 3],
      [1, 5, 4, 2]
    ];
    parList = [2, 4, 3, 4];
    selected_hole = "0";
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
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
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 0, top: 20),
                                      child: CircleButton(
                                          iconData: Icons.arrow_back,
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MyApp();
                                            }));
                                          }),
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 50, right: 50, top: 20),
                                      height: 100,
                                      width: 100,
                                      child: GestureDetector(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black87,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text("Hole #",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                Text(
                                                  "12",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 46,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 30, right: 0),
                                        child: Column(
                                          children: <Widget>[
                                            SleekCircularSlider(
                                              appearance:
                                                  CircularSliderAppearance(
                                                      customColors:
                                                          CustomSliderColors(
                                                              trackColor:
                                                                  Colors.black,
                                                              progressBarColor:
                                                                  Colors.green),
                                                      customWidths:
                                                          CustomSliderWidths(
                                                              progressBarWidth:
                                                                  10),
                                                      size: 50),
                                              min: 0,
                                              max: 100,
                                              initialValue: 67,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 160),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Pebble Beach',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'Santa Cruz, CA - 07/24/2019',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 240,
                                width: MediaQuery.of(context).size.width,
                                child: Image.asset(
                                  "assets/images/bg.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 212, left: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.all(2),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(25.0),
                                color: Colors.green),
                            child: Center(
                                child: Text(
                              (1).toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(left: 20, top: 2, right: 2),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(25.0),
                              border: new Border.all(
                                width: 4.0,
                                color: Colors.white,
                              ),
                            ),
                            child: Center(
                                child: GestureDetector(
                              child: Text(
                                (2).toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {},
                            )),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(left: 20, top: 2, right: 2),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(25.0),
                              border: new Border.all(
                                width: 4.0,
                                color: Colors.white,
                              ),
                            ),
                            child: Center(
                                child: GestureDetector(
                              child: Text(
                                (3).toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {},
                            )),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(left: 70),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(25.0),
                                color: Colors.green),
                            child: Center(
                              child: Icon(
                                Icons.aspect_ratio,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 3 - 7,
                              child: Card(
                                margin: EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.wb_sunny)),
                                    Text(
                                      "58\'",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "Cloudy",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 26,
                                              fontWeight: FontWeight.normal),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3 - 7,
                              child: Card(
                                margin: EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.wb_iridescent)),
                                    Text(
                                      "54mph",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "Windy",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 26,
                                              fontWeight: FontWeight.normal),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3 - 7,
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.wb_sunny)),
                                    Text(
                                      "SE",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "Wind",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 26,
                                              fontWeight: FontWeight.normal),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(left: 10, top: 5),
                                  alignment: FractionalOffset.topLeft,
                                  child: Text(
                                    'Past Score',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.black),
                                  )),
                              Container(
                                padding: EdgeInsets.only(left: 10, top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'You played this hole',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      '17 days ago ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.all(2),
                                          decoration: new BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      25.0),
                                              color: Colors.black45),
                                          child: Center(
                                              child: Text(
                                            "CA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.only(left: 45),
                                          decoration: new BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      25.0),
                                              color: Colors.red),
                                          child: Center(
                                              child: Text(
                                            "+3",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, left: 100),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'You played ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 20,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                '8',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.all(2),
                                          decoration: new BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      25.0),
                                              color: Colors.red),
                                          child: Center(
                                              child: Text(
                                            "HM",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              width: 50,
                                              height: 50,
                                              margin: EdgeInsets.only(left: 45),
                                              decoration: new BoxDecoration(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          25.0),
                                                  color: Colors.green),
                                              child: Center(
                                                  child: Text(
                                                "-1",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 26,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 10, right: 10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Hanna played ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 20,
                                                        color: Colors.grey),
                                                  ),
                                                  Text(
                                                    '4',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: new BoxDecoration(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        23.0),
                                                border: new Border.all(
                                                  width: 2.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Center(
                                                  child: GestureDetector(
                                                child: Icon(
                                                  Icons.add,
                                                  size: 34,
                                                ),
                                                onTap: () {},
                                              )),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    child: Card(
                                      child: Image.asset("assets/images/bg.jpg", height: 565,width: MediaQuery.of(context).size.width-180,fit: BoxFit.fill,),
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 20, top: 500),
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      border: new Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                      color: Colors.green
                                    ),
                                    child: Center(
                                        child: GestureDetector(
                                          child: Icon(Icons.search, color: Colors.white,size: 30,),
                                          onTap: () {},
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      color: Colors.green,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 3),
                                        height: 120,
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("5",style: TextStyle(color:Colors.white,fontSize: 36, fontWeight: FontWeight.bold),),
                                            Text("Par",style: TextStyle(color:Colors.white,fontSize: 36, fontWeight: FontWeight.normal),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      color: Colors.brown,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 3, left: 3),
                                        height: 70,
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("1",style: TextStyle(color:Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                                            Text("Handicap",style: TextStyle(color:Colors.white, fontSize: 22, fontWeight: FontWeight.normal),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 3, left: 3),
                                        padding: EdgeInsets.only(left: 20),
                                        height: 80,
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Blue",style: TextStyle(color:Colors.blue, fontSize: 26, fontWeight: FontWeight.bold),),
                                            Row(
                                              children: <Widget>[
                                                Text("572",style: TextStyle(color:Colors.black, fontSize: 22, fontWeight: FontWeight.normal),),
                                                Text("yd",style: TextStyle(color:Colors.grey, fontSize: 22, fontWeight: FontWeight.normal),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 3, left: 3),
                                        padding: EdgeInsets.only(left: 20),
                                        height: 80,
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Gold",style: TextStyle(color:Colors.yellowAccent, fontSize: 26, fontWeight: FontWeight.bold),),
                                            Row(
                                              children: <Widget>[
                                                Text("560",style: TextStyle(color:Colors.black, fontSize: 22, fontWeight: FontWeight.normal),),
                                                Text("yd",style: TextStyle(color:Colors.grey, fontSize: 22, fontWeight: FontWeight.normal),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 3, left: 3),
                                        padding: EdgeInsets.only(left: 20),
                                        height: 80,
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("White",style: TextStyle(color:Colors.grey, fontSize: 26, fontWeight: FontWeight.bold),),
                                            Row(
                                              children: <Widget>[
                                                Text("548",style: TextStyle(color:Colors.black, fontSize: 22, fontWeight: FontWeight.normal),),
                                                Text("yd",style: TextStyle(color:Colors.grey, fontSize: 22, fontWeight: FontWeight.normal),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 3, left: 3),
                                        padding: EdgeInsets.only(left: 20),
                                        height: 80,
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Red",style: TextStyle(color:Colors.red, fontSize: 26, fontWeight: FontWeight.bold),),
                                            Row(
                                              children: <Widget>[
                                                Text("436",style: TextStyle(color:Colors.black, fontSize: 22, fontWeight: FontWeight.normal),),
                                                Text("yd",style: TextStyle(color:Colors.grey, fontSize: 22, fontWeight: FontWeight.normal),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              List<dynamic> userScoresSum = [0,0,0];
                              int par_total_sum = 0;
                              int par_score_difference = 0;

                              for(int i=0;i<parList.length;i++){
                                par_total_sum = par_total_sum + parList[i];
                              }

                              for(int i=0;i<usersScoresList.length;i++){
                                for(int j=0;j<usersScoresList[0].length;j++){
                                  userScoresSum[i] = userScoresSum[i] + usersScoresList[i][j];
                                }
                              }

                              String shortUserName;
                              if(index!=0) {
                                shortUserName = usersList[index-1].split(" ")[0].substring(0,1) + // first word of first name
                                    usersList[index-1].split(" ")[1].substring(0,1); // first word of last name
                                par_score_difference = userScoresSum[index-1]-par_total_sum;
                              }

                              print("par_total_sum: "+par_total_sum.toString());
                              print("userScoresSum: "+userScoresSum.toString());
                              print("par_score_difference: "+par_score_difference.toString());

                              return Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 50,
                                            height: 50,
                                            margin: EdgeInsets.all(2),
                                            decoration: new BoxDecoration(
                                              borderRadius: new BorderRadius.circular(25.0),
                                              border: new Border.all(
                                                width: 2.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Center(
                                                child: Text(index == 0 ? (parList.length+1).toString(): shortUserName, style: TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold),)
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(index == 0 ? "Hole "+(parList.length+1).toString(): usersList[index-1], style: TextStyle(fontWeight: FontWeight.bold),),
                                                Row(
                                                  children: <Widget>[
                                                    Text(index == 0 ? "Enter par" : "Currently ",style: TextStyle(color: Colors.grey),),
                                                    Text(index == 0 ? " " : par_score_difference.toString() ,style: TextStyle(color: par_score_difference < 1 ? Colors.green : Colors.red, fontSize: 22, fontWeight: FontWeight.bold  ),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Stack(
                                        alignment: FractionalOffset.center,
                                        children: <Widget>[
                                          Container(
                                            width: 55,
                                            height: 55,
                                            margin: EdgeInsets.only(left:40, right: 40, top: 5, bottom: 5),
                                            decoration: new BoxDecoration(
                                              borderRadius: new BorderRadius.circular(25.0),
                                              color: Colors.black87,
                                            ),
                                            child: Center(
                                                child: Text(counter[index].toString(), style: TextStyle(color: Colors.white,fontSize: 36, fontWeight: FontWeight.bold),)
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 50,
                                            margin: EdgeInsets.only(left: 75),
                                            decoration: new BoxDecoration(
                                                borderRadius: new BorderRadius.circular(25.0),
                                                color: index==0? Colors.grey : Colors.red,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.white
                                                )
                                            ),
                                            child: Center(
                                                child: GestureDetector(
                                                  child: Text("+", style: TextStyle(color: Colors.white,fontSize: 36, fontWeight: FontWeight.bold),),
                                                  onTap: (){
                                                    setState(() {
                                                      counter[index] = counter[index]+1;
                                                    });
                                                  },
                                                )
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 50,
                                            margin: EdgeInsets.only(right: 75),
                                            decoration: new BoxDecoration(
                                                borderRadius: new BorderRadius.circular(25.0),
                                                color: index ==0 ? Colors.grey : Colors.green,
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.white
                                                )
                                            ),
                                            child: Center(
                                                child: GestureDetector(
                                                  child: Text("-", style: TextStyle(color: Colors.white,fontSize: 36, fontWeight: FontWeight.bold),),
                                                  onTap: (){
                                                    setState(() {
                                                      counter[index] = counter[index]-1;
                                                    });
                                                  },
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
