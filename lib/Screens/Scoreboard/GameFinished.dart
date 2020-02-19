import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GameFinished extends StatefulWidget {
  @override
  _GameFinishedState createState() => _GameFinishedState();
}

class _GameFinishedState extends State<GameFinished> {

  List<String> usersList;
  List<dynamic> scoresList;
  List<dynamic> scores2List;


  @override
  void initState() {
    usersList = ["Chris A.","Hanna M.","John D."];
    scoresList = [-1,0,2];
    scores2List = [-0.02,0,0.11];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              color: Color(0xff5BC8A1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        child: IconButton(icon: Icon(Icons.share, color: Colors.white,)),
                        backgroundColor: Colors.blue,
                        radius: 26,
                      ),
                      Image.asset("assets/images/logo.png"),
                      CircleAvatar(
                        child: IconButton(
                            icon: Icon(Icons.close, color: Colors.black,),
                          onPressed: (){
                              Navigator.of(context).pop();
                          },
                        ),
                        backgroundColor: Colors.white,
                        radius: 26,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Pebble Beach', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42,color: Colors.white),),
                        Text('Santa Cruz, CA - 18 holes', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16,color: Colors.white70),),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        child: CircleAvatar(
                          child: IconButton(icon: Icon(Icons.timer, color: Colors.white,)),
                          backgroundColor: Colors.green,
                        ),
                      ),
                      Text("Finished in ", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16,color: Colors.white70),),
                      Text("94 minutes", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16,color: Colors.white),)
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context,index){

                      List<dynamic> userScoresSum = [0,0,0];
                      int par_total_sum = 0;
                      int par_score_difference = 0;

                      String shortUserName;
                        shortUserName = usersList[index].split(" ")[0].substring(0,1) + // first word of first name
                            usersList[index].split(" ")[1].substring(0,1); // first word of last name
                        par_score_difference = userScoresSum[index]-par_total_sum;

                      return Container(

                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Stack(
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
                                        child: Text((index+1).toString(), style: TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold),)
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 40),
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.circular(25.0),
                                      border: new Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                      color: scoresList[index]<0 ? Colors.green : scoresList[index]==0? Colors.black : Colors.yellow,
                                    ),
                                    child: Center(
                                        child: Text(scoresList[index]<0 ? (scoresList[index]).toString() : scoresList[index]==0? (scoresList[index]).toString():"+"+(scoresList[index]).toString(), style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 80),
                                    decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        border: new Border.all(
                                          width: 2.0,
                                          color: Colors.white,
                                        ),
                                        color: Colors.redAccent
                                    ),
                                    child: Center(
                                        child: Text((shortUserName).toString(), style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    margin: EdgeInsets.only(left: 120),
                                    decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.circular(25.0),
                                        border: new Border.all(
                                          width: 2.0,
                                          color: Colors.white,
                                        ),
                                        color: scores2List[index]<0 ? Colors.green : scores2List[index]==0? Colors.black : Colors.yellow
                                    ),
                                    child: Center(
                                        child: Text(scores2List[index]<0 ? (scores2List[index]).toString() : scores2List[index]==0? (scores2List[index]).toString():"+"+(scores2List[index]).toString(), style: TextStyle(color: Colors.white,fontSize: 10, fontWeight: FontWeight.bold),)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(usersList[index].toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22),),
                                  Row(
                                    children: <Widget>[
                                      Text("1.05", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16),),
                                      Text(" New hand", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey, fontSize: 16),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
            ),
            Container(
              height: 60,
              width: 250,
              margin: EdgeInsets.only(top: 20, bottom: 60),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Center(child: Text("VIEW SCORECARD", style: TextStyle(color: Colors.white, fontSize: 26),)),
            ),
          ],
        ),
      ),
    );
  }
}
