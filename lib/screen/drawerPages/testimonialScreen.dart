import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_cable/screen/homepageScreen.dart';
import 'package:flutter_cable/widgets/ipaddress.dart' as prefix0;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class Testimonial extends StatefulWidget {
  @override
  _TestimonialState createState() => _TestimonialState();
}

class _TestimonialState extends State<Testimonial> {
  Map<String, dynamic> _formData = {};

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  void addData(Map<String, dynamic> body) async {
    var url = "https://1000ftcables.com/appdata/addreviews.php";
    var response = await http.post(url, body: jsonEncode(body));
    var message = json.decode(response.body);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Alert Dialog",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ),
        content: Text(
          message,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        actions: [
          FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(
                  context,
                  
                );
              })
        ],
      ),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit Review"),
        centerTitle: true,
        backgroundColor: prefix0.appBarColor,
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(prefix0.bg1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 90, 25, 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: prefix0.appBarColor,
                          offset: Offset(5, 5),
                          blurRadius: 10.0,
                        )
                      ]),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 14.0),
                      TextFormField(
                        controller: nameController,
                        onChanged: (value) {
                          _formData['name'] = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Name Required";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        cursorColor: prefix0.appBarColor,
                        decoration: InputDecoration(
                          prefixIcon: Material(
                            color: Colors.transparent,
                            child: Icon(
                              Icons.person,
                              color: prefix0.appBarColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: prefix0.appBarColor)),
                          contentPadding: const EdgeInsets.all(
                            16.0,
                          ),
                          hintText: "Name",
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: messageController,
                        onChanged: (value) {
                          _formData['message'] = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Your Message...";
                          }
                          return null;
                        },
                        cursorColor: prefix0.appBarColor,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          contentPadding: const EdgeInsets.all(
                            16.0,
                          ),
                          hintText: " Message ",
                        ),
                        maxLines: 4,
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        child: Text(
                          "Your Rating:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                          top: 10,
                        ),
                        child: FlutterRatingBar(
                          initialRating: 0,
                          fillColor: Colors.amber,
                          borderColor: Colors.amber,
                          allowHalfRating: true,
                          onRatingUpdate: (value) {
                            _formData['rating_value'] = value.round();
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(),
                        child: RaisedButton(
                          elevation: 0,
                          highlightElevation: 0,
                          textColor: Colors.white,
                          color: prefix0.appBarColor,
                          onPressed: () => {
                            if (formKey.currentState.validate())
                              {addData(_formData)}
                          },
                          child: Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
