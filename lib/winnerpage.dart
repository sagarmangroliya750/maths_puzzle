// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:maths_puzzle/second.dart';
import 'package:share_plus/share_plus.dart';

import 'main.dart';

class third extends StatefulWidget {
  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  List clr = [
    Colors.white24,
    Colors.white24,
    Colors.white24,
  ];
  int curt_ind = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("images/background.jpg"),
        )),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40),
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                //color: Colors.black,
                child: Row(
                  children: [
                    SizedBox(width:15),
                    Container(
                      decoration:BoxDecoration(borderRadius:BorderRadius.circular(50),
                          gradient:LinearGradient(colors:[
                            Colors.blueGrey, Colors.white,
                            Colors.blueGrey, Colors.blueGrey
                          ])),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return puzzle(0);
                              },
                            ));
                          },
                          icon: Icon(Icons.home,size:27,color:Colors.indigo,)),
                    ),
                    SizedBox(width:25),
                    Text(
                      "🎊 COMPLIETED 🎊",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'font2'),
                    ),
                  ],
                )),
            Expanded(
                flex: 5,
                child: Container(
                    margin: EdgeInsets.only(top: 60),
                    width: double.infinity,
                    height: double.infinity,
                    //     color: Colors.red,
                    child: Image(
                      image: AssetImage("images/trophy.png"),
                    ))),
            Expanded(
                flex: 8,
                child: Container(
                  margin: EdgeInsets.only(bottom: 100),
                  width: double.infinity,
                  height: double.infinity,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return second();
                            },
                          ));
                        },
                        child: Container(
                          //color: Colors.yellow,
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(colors: [
                              Colors.blueGrey,
                              Colors.white,
                              Colors.blueGrey,
                              Colors.blueGrey
                            ]),
                          ),
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return puzzle(0);
                            },
                          ));
                          setState(() {});
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(colors: [
                              Colors.blueGrey,
                              Colors.white,
                              Colors.blueGrey,
                              Colors.blueGrey
                            ]),
                          ),
                          child: Text(
                            "MAIN MENU",
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        //   color: Colors.yellow,
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 30),
                        child: Text(
                          "BUY PRO",
                          style: TextStyle(fontSize: 23),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(colors: [
                            Colors.blueGrey,
                            Colors.white,
                            Colors.blueGrey,
                            Colors.blueGrey
                          ]),
                        ),
                      ),
                      Text("SHARE THIS PUZZLE",
                          style: TextStyle(fontSize: 18, fontFamily: 'font2')),
                      InkWell(
                        onTap: () {
                          Share.share(
                              'https://play.google.com/store/apps/details?id=com.applabs.puzzle');
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(top: 20),
                          child: Icon(
                            Icons.share,
                            size: 30,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.5),
                              borderRadius: BorderRadius.circular(14),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueGrey,
                                  Colors.blueGrey,
                                  Colors.white,
                                  Colors.blueGrey,
                                  Colors.blueGrey,
                                  Colors.blueGrey,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
