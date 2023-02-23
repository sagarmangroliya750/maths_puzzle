// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class level extends StatefulWidget {
  int curt_ind;
  level(this.curt_ind);

  @override
  State<level> createState() => _levelState();
}

class _levelState extends State<level> {
  SharedPreferences ? pref;
  int curt_ind =0 ;
  List list = [];
  String str = '';
  get_pref()
  async {
    pref= await SharedPreferences.getInstance();
    curt_ind = pref!.getInt("puzzle") ?? 0;

    for(int i = 0; i< curt_ind; i++)
      {
        String str = pref!.getString("levelstatus$i") ?? "win";
        list[i] = str;
      }
    print(list);
    setState(() {
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = List.filled(75, "");
    get_pref();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/background.jpg"))),
        child: Column(
          children: [
            Expanded(
                child: Container(
              //color: Colors.blueGrey,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Select Puzzle",
                style: TextStyle(
                  fontSize: 33,
                  fontStyle: FontStyle.italic,
                  color: Colors.indigo,
                ),
              ),
            )),
            Expanded(
                flex: 20,
                child: Container(
                  // color: Colors.red,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(3),
                  child: GridView.builder(
                    itemCount:75,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 3,
                    ),

                    itemBuilder: (context, index) {
                      return Container(
                      //  color: Colors.indigo,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          image: (index < curt_ind) ? (list[index] == "win") ?
                            DecorationImage(image: AssetImage("images/tick.png")) : null
                            : DecorationImage(image: AssetImage("images/lock.png")),
                          border:  (index < curt_ind) ? Border.all(width: 1.5) : null,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: (index < curt_ind) ?
                        Text("${index+1}",
                        style: TextStyle(
                          fontFamily: "font1",
                          fontSize: 40,
                        ),) : null,
                      );
                    },
                  ),
                )),
            Expanded(
              flex: 4,
              child: Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(left: 285,bottom: 15),
                  width: 100,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                    //    color: Colors.indigo,
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(25),
                        child: Icon(Icons.arrow_forward_rounded,size: 65,),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
