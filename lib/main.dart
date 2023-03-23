// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last, prefer_const_literals_to_create_immutables, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:maths_puzzle/second.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';
import 'levelpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: puzzle(0),
  ));
}

class puzzle extends StatefulWidget {
  int curt_ind;

  puzzle(this.curt_ind);

  @override
  State<puzzle> createState() => _puzzleState();
}

class _puzzleState extends State<puzzle> {
  bool temp1 = false;
  bool temp2 = false;
  bool temp3 = false;
  int curt_ind = 0;

  SharedPreferences? pref;

  set_pref() async {
    pref = await SharedPreferences.getInstance();
    curt_ind = pref?.getInt("puzzle") ?? 0;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    set_pref();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: SafeArea(
          child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/background.jpg"),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  child: Text(
                    "Math Puzzles",style: TextStyle(color:Colors.indigo,fontSize: 30,fontFamily:'font2',fontStyle: FontStyle.italic,),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("images/blackboard_main_menu.png"),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTapDown: (details) {
                          temp1 = true;
                          setState(() {});
                        },
                        onTapUp: (details) {
                          temp1 = false;
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return second();
                            },
                          ));
                          setState(() {});
                        },
                        onTapCancel: () {
                          temp1 = false;
                          setState(() {});
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          //      color: Colors.red,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          decoration: temp1
                              ? BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.white),
                                  borderRadius: BorderRadius.circular(3))
                              : null,
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontFamily: "font1",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTapDown: (details) {
                          temp2 = true;
                          setState(() {});
                        },
                        onTapUp: (details) {
                          temp2 = false;
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return level(widget.curt_ind);
                            },
                          ));
                          setState(() {});
                        },
                        onTapCancel: () {
                          temp2 = false;
                          setState(() {});
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          decoration: temp2
                              ? BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.white),
                                  borderRadius: BorderRadius.circular(3))
                              : null,
                          child: Text(
                            "PUZZLES",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontFamily: "font1",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTapDown: (details) {
                          temp3 = true;
                          setState(() {});
                        },
                        onTapUp: (details) {
                          temp3 = false;
                          showDialog(
                            barrierDismissible:false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  "Benefits of pro version",
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 23,
                                  ),
                                ),
                                content: const Text(
                                  "1. No Ads\n"
                                  "2. No wait time for hint and skip\n"
                                  "3. Hint for every level\n"
                                  "4. Solution for every level",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    //height: 2
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        // color: Colors.lightBlue,
                                        width: 90,
                                        height:40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(7),
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
                                        child: Text("BUY", style: TextStyle(color: Colors.black)),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 90,
                                        height: 40,
                                        margin: EdgeInsets.only(right: 40),
                                        alignment: Alignment.center,
                                        child: Text( "NO, THANKS",style: TextStyle(color: Colors.black)),
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1.5),
                                            borderRadius: BorderRadius.circular(7),
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
                                      )),
                                ],
                              );
                            },
                          );
                          setState(() {});
                        },
                        onTapCancel: () {
                          temp3 = false;
                          setState(() {});
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          decoration: temp3
                              ? BoxDecoration(
                                  border: Border.all( width: 1.5, color: Colors.white),
                                  borderRadius: BorderRadius.circular(3))
                              : null,
                          child: Text(
                            "BUY PRO",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontFamily: "font1",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                margin: EdgeInsets.only(left: 20, top: 20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/ltlicon.png"))),
                              ),
                              InkWell(
                                onTap: () {
                                  Share.share(
                                      'https://play.google.com/store/apps/details?id=com.applabs.puzzle');
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.only(
                                      left: 170, right: 5, bottom: 10),
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
                              Container(
                                height:40,
                                width: 40,
                                margin: EdgeInsets.only(bottom:10),
                                child: Icon(
                                  Icons.email_outlined,
                                  size: 30,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1.5),
                                    borderRadius: BorderRadius.circular(15),
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
                            ],
                          ),
                        ],
                      )
                    )),
                 ],
             ),
          ),
      )),
    );
  }
  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            ("Are you sure you want to Exit App?"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                "No",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
    return exitApp ? false : true;
  }
}
