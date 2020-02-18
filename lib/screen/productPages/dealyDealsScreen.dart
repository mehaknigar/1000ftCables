import 'package:flutter/material.dart';
import 'package:flutter_cable/screen/catagoriesScreens/cat6Screen.dart';
// import 'package:flutter_cable/widgets/cable.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:async';

class DailyDeals extends StatefulWidget {
  static const routeName = '/dealyDeals';
  @override
  _DailyDealsState createState() => _DailyDealsState();
}

class _DailyDealsState extends State<DailyDeals> {
  // Future navigateToCable(context) async {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => Cable()));
  // }


   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
         body: ListView(
          children: <Widget>[
            Card(
               color: Colors.grey,
              child: GestureDetector(
                  onTap: () {
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => Cat5eBulkCables()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                      flex: 1,
                      child: 
                          Container(
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        
                    ),
                    Expanded(
                      flex: 4,
                      child: 
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 5,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Cat5e Bulk Cables",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: 
                      Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5,
                          ),
                         // padding: EdgeInsets.only(left: 115),
                          child: Icon(Icons.arrow_forward_ios)),)
                    ],
                  )),
            ),
            Card( color: Colors.grey,
               child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cat6Bulk()));
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 0, left: 0),
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                    
                    Expanded(
                      flex: 4,
                      child: 
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Cat6 Bulk Cables",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                    ),
                     Expanded(
                      flex: 1,
                      child: 
                Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                   // padding: EdgeInsets.only(left: 125),
                    child: Icon(Icons.arrow_forward_ios)),),
              ],
            ))),
            Card( color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 0, left: 0),
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                     Expanded(
                      flex: 4,
                      child: 
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Cat6A Bulk Cables",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),),
                 Expanded(
                      flex: 1,
                      child: 
                Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    //padding: EdgeInsets.only(left: 115),
                    child: Icon(Icons.arrow_forward_ios))),
              ],
            )),
            Card( color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 0, left: 0),
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                     Expanded(
                      flex: 4,
                      child: 
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Patch Cords",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                     )),
                      Expanded(
                      flex: 1,
                      child: 
                Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                   // padding: EdgeInsets.only(left: 160),
                    child: Icon(Icons.arrow_forward_ios))),
              ],
            )),
            Card( color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 0, left: 0),
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                     Expanded(
                      flex: 4,
                      child: 
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Coaxial Cables",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                      ) ),
                Expanded(
                      flex: 1,
                      child:  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                   // padding: EdgeInsets.only(left: 140),
                    child: Icon(Icons.arrow_forward_ios))),
              ],
            )),
            Card( color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 0, left: 0),
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                Expanded(
                      flex: 4,
                      child:  Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Cable Management",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                )),
                 Expanded(
                      flex: 1,
                      child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                   // padding: EdgeInsets.only(left: 110),
                    child: Icon(Icons.arrow_forward_ios))),
              ],
            )),
            Card( color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 0, left: 0),
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                Expanded(
                      flex: 4,
                      child:  Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Fiber Testing Tools",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                 ) ),
                Expanded(
                      flex: 1,
                      child:  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                   // padding: EdgeInsets.only(left: 110),
                    child: Icon(Icons.arrow_forward_ios))),
              ],
            )),
            Card( color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 0, left: 0),
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                Expanded(
                      flex: 4,
                      child:  Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Tools & Equipment",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                 ) ),
                Expanded(
                      flex: 1,
                      child:  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    //padding: EdgeInsets.only(left: 110),
                    child: Icon(Icons.arrow_forward_ios))),
              ],
            )),
            Card( color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 0, left: 0),
                            child: Image.asset(
                              'Assets/images/cable.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                Expanded(
                      flex: 4,
                      child:  Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 5,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Satellite TV Accessories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                 ) ),
                Expanded(
                      flex: 1,
                      child:  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    //padding: EdgeInsets.only(left: 50),
                    child: Icon(Icons.arrow_forward_ios))),
              ],
            )),
          ],
        ));
            
  
}}
