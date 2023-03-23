// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors, prefer_is_empty, use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_brace_in_string_interps, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:maths_puzzle/winnerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class second extends StatefulWidget {
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  bool temp = false;
  int curt_ind = 0;
  int curt_img = 1;
  String ans = "";
  List ans_ok = [
    10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140,150, 160, 170, 180, 190, 200
  ];
  List img = [
    "p1.png", "p2.png", "p3.png", "p4.png", "p5.png", "p6.png", "p7.png", "p8.png", "p9.png", "p10.png",
    "p11.png", "p12.png", "p13.png", "p14.png", "p15.png", "p16.png", "p17.png", "p18.png", "p19.png", "p20.png",
    "p21.png", "p22.png", "p23.png", "p24.png", "p25.png", "p26.png", "p27.png", "p28.png", "p29.png", "p30.png",
  ];
  SharedPreferences? pref;

  set_pref() async {
    pref = await SharedPreferences.getInstance();
    curt_ind = pref!.getInt("puzzle") ?? 0;
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
              image: AssetImage("images/gameplaybackground.jpg"),
            )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          barrierDismissible:false,
                          context: context, builder: (context) {
                          return AlertDialog(
                            title:Text("Are you sure to skip this level ??",style:TextStyle(fontSize:15,fontFamily:'font2')),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                Navigator.pop(context);
                              }, child:Text("Go Back",style:TextStyle(fontFamily:'font2'))),
                              TextButton(onPressed: () {
                                pref!.setString("levelstatus$curt_ind", "skip");
                                curt_ind++;
                                pref!.setInt("puzzle", curt_ind);
                                ans = "";
                                Navigator.pop(context);
                                setState(() {});
                              }, child:Text("Yes Skip",style:TextStyle(color:Colors.green,fontFamily:'font2')))
                            ],
                          );
                        },);
                      },
                      child: Container(
                        height: 48, width: 48,
                        margin: EdgeInsets.only(right: 25),
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/skip3.png"),
                            )),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/level_board.png"),
                      )),
                      child: Text(
                        "Puzzle ${curt_ind + 1}",
                        style: TextStyle(fontSize: 30,fontFamily: 'font1'),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      margin: EdgeInsets.only(left: 25),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/hint111.jpg"),
                          )),
                    ),
                  ],
                ),
                Expanded(
                  flex:14,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Image(
                      image: AssetImage("images/${img[curt_ind]}"),
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Expanded(
                  flex:3,
                  child: Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration:BoxDecoration( color: Colors.white,borderRadius:BorderRadius.circular(7)),
                                height:35,width:200,
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: Text(" ${ans}",
                                  style: TextStyle(fontSize:18,fontFamily:'font2'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (ans.length > 0) {
                                    ans = ans.substring(0, ans.length - 1);
                                  }
                                  setState(() {});
                                },
                                onLongPress:() {
                                  setState(() {
                                    ans = "";
                                  });
                                },
                                child: Container(
                                  margin:EdgeInsets.only(right:10),
                                  height: 40,width: 40,
                                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/delete.png"))),
                                ),
                              ),
                              // InkWell(
                              //   onTapDown: (details) {
                              //     temp = true;
                              //     setState(() {});
                              //   },
                              //   onTapUp: (details) {
                              //
                              //   },
                              //   onTapCancel: () {
                              //     temp = false;
                              //     setState(() {});
                              //   },
                              // ),
                              SizedBox(
                                width:90,
                                child: GFButton(
                                  onPressed: (){
                                    temp = false;
                                    setState(() {
                                      if (ans_ok[curt_ind] == int.parse(ans))
                                      {
                                        curt_ind++;
                                        ans = "";
                                        pref!.setInt("puzzle", curt_ind);
                                        Navigator.push(context, MaterialPageRoute( builder: (context) {
                                            return third();
                                          },
                                        ));
                                        setState(() {});
                                      } else {
                                        ans = "";
                                        Fluttertoast.showToast(
                                          msg: "Wrong Answer !!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      }
                                    });
                                  },
                                  text: "SUBMIT",textStyle:TextStyle(fontSize:15,color:ans.isNotEmpty ? Colors.green : Colors.white),
                                  size: 35,
                                  type:GFButtonType.outline,color:ans.isNotEmpty ? Colors.green : Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("1"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("2"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("3"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("4"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("5"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("6"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("7"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("8"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("9"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () => get("0"),
                                child: Container(
                                  height: 35,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white38),
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white24),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              )),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        )));
  }

  get(String a) {
    ans = ans + a.toString();
    setState(() {});
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            ("Are you sure you want to exit?"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                "No",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Yes", style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
    return exitApp ?? false;
  }
}
