import 'package:flutter/material.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'dart:convert';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  List review = [];

  Future fetchData() async {
    final response =
        await http.get('https://1000ftcables.com/appdata/getReviews.php');

    if (response.statusCode == 200) {
      setState(() {
        review = json.decode(response.body);
      });
    }
  }

  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Reviews"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: ListView.builder(
        itemCount: review.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  bottom: 10,
                ),
                child: Text(
                  review[index]['name'],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  bottom: 30,
                  right: 15,
                ),
                child: Text(
                  review[index]['message'],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
