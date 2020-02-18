import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/homepageScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class Testimonial extends StatefulWidget {
  @override
  _TestimonialState createState() => _TestimonialState();
}

class _TestimonialState extends State<Testimonial> {
   
    Map<String, dynamic> _formData = {};
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 // TextEditingController nameController = new TextEditingController();
  //TextEditingController ratingController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();

   void addData(Map<String, dynamic> body) async {
    var url = "https://1000ftcables.com/appdata/addreviews.php";
    var response = await http.post(url, body: jsonEncode(body));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
    print(response.body);
  }

// void addData() async {
     
//       var url = "https://1000ftcables.com/appdata/addreviews.php";
//       var response = await http.post(url, body: {
//        // "name": nameController.text,
//         "message": messageController.text,
         

        
//       });
//       print(response.body);
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => Login(),
//       //   ),
      
     
//   }

//   // Map<String, dynamic> _formData = {
//   //   'name': null,
//   //   //'message': null,
//   // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit Review"),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("Assets/images/BG.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child:Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                    left: 20,
                  ),
                  child: Text(
                    "Name:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 25,
                    top: 10,
                  ),
                  child: TextFormField(
                   // controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Name",
                      contentPadding: new EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    onSaved: (String value) {
                      _formData['name'] = value;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: Text(
                    "Your Rating:",
                    style: TextStyle(
                      color: Colors.white,
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
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Text(
                    "Your Message:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 25,
                    top: 10,
                  ),
                  child: TextFormField(
                    controller: messageController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Message",
                      contentPadding: new EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    onSaved: (value) {
                      _formData['message'] = value;
                    },
                  ),
                ),
                Center(
                  child: ScopedModelDescendant(
                    builder:
                        (BuildContext context, Widget child, MainModel model) {
                      return Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                           // model.submitreviews(_formData);
                           addData(_formData);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}
