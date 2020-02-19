import 'package:birdies_scop/Screens/Scoreboard/ScoreboardEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class ScorecardView extends StatefulWidget {
  @override
  _ScorecardViewState createState() => _ScorecardViewState();
}

class _ScorecardViewState extends State<ScorecardView> {

  List<String> usersList;
  List<dynamic> usersScoresList;
  List<dynamic> parList;


  @override
  void initState() {
    usersList = ["Chris A.","Hanna M.","John D."];
    usersScoresList = [[5,3,1,5,1,6,8,9,9,7,8,9,5,2,7,6,8],[4,2,2,3,1,3,8,4,3,9,1,5,3,7,2,8,5],[1,5,4,2,1,3,7,2,6,9,5,4,2,8,6,5,9]];
    parList = [2,4,3,4,7,6,5,3,5,4,4,3,3,5,4,7,8];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            margin: EdgeInsets.all(12),
                            child: RotatedBox(
                              child: Text('Hole', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              quarterTurns: 3,
                            ),
                          ),
                          Container(
                            width: 50,
                            margin: EdgeInsets.all(2),
                            child: RotatedBox(
                              child: Text('Par', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              quarterTurns: 3,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(5, 4, 4, 4),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(25.0),
                                color: Colors.black87
                            ),
                            child: Center(
                                child: Text("CA", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.fromLTRB(5, 4, 4, 4),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(25.0),
                                color: Colors.red
                            ),
                            child: Center(
                                child: Text("HM", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(right: 0, bottom: 4, top: 4, left: 5),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(25.0),
                                color: Colors.blue
                            ),
                            child: Center(
                                child: Text("JD", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 60,
                              padding: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: parList.length,
                                      itemBuilder: (context,index){
                                        return Container(
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
                                        );
                                      },
                                    ),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              padding: EdgeInsets.all(3),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: parList.length,
                                      itemBuilder: (context,index){
                                        return Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.all(2),
                                          decoration: new BoxDecoration(
                                              borderRadius: new BorderRadius.circular(25.0),
                                              color: Colors.black87
                                          ),
                                          child: Center(
                                              child: Text((parList[index]).toString(), style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                                          ),
                                        );
                                      },
                                    ),
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 60,
                              padding: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: usersScoresList[0].length,
                                      itemBuilder: (context,index){
                                        return Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.all(2),
                                          decoration: new BoxDecoration(
                                              borderRadius: new BorderRadius.circular(25.0),
                                              color: Colors.orangeAccent
                                          ),
                                          child: Center(
                                              child: Text((usersScoresList[0][index]).toString(), style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              padding: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: usersScoresList[1].length,
                                      itemBuilder: (context,index){
                                        return Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.all(2),
                                          decoration: new BoxDecoration(
                                              borderRadius: new BorderRadius.circular(25.0),
                                              color: Colors.green
                                          ),
                                          child: Center(
                                              child: Text(((usersScoresList[1][index])).toString(), style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              padding: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: usersScoresList[2].length,
                                      itemBuilder: (context,index){
                                        return Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.all(2),
                                          decoration: new BoxDecoration(
                                              borderRadius: new BorderRadius.circular(25.0),
                                              color: Colors.black87
                                          ),
                                          child: Center(
                                              child: Text(((usersScoresList[2][index])).toString(), style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),)
                                          ),
                                        );
                                      },
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 250,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Center(child: Text("RETURN TO GAME", style: TextStyle(color: Colors.white, fontSize: 26),)),
                  )
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
