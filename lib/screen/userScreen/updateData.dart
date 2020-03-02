import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/widgets/ipaddress.dart' as prefix0;
import 'package:flutter_cable/widgets/preference.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateData extends StatefulWidget {
  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loggedInPresent = false, loggedIn = false;
  SharedPreferences sharedPreferences;
  final TextEditingController shippingAddress = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController zipcode = TextEditingController();
  @override
  Map<String, dynamic> _formData = {};

  List data = [];
  User user;
  MainModel model;
  @override

  
 void initState() {
    super.initState();
    model = ScopedModel.of<MainModel>(context);

    _formData['user'] = model.getLoggedInUser;
    _formData['user_id'] = model.getLoggedInUser.user_id;

    PreferenceManager.getDetails().then((user) {
      _formData['user'] = user.toJson();
    });
  }

  void getUserDetails() async {
    user = await PreferenceManager.getDetails();
    setState(() {});
  }

   addData(Map<String, dynamic> body) async {
    var url =
        "https://1000ftcables.com/appdata/updateAdddress.php?user_id=${_formData['user_id']}";
    var response = await http.post(url, body: jsonEncode(body));
    var message = json.decode(response.body);
    //await sharedPreferences.setString("s_city", city.text.toString());
    Navigator.pop(context);
    Navigator.pop(context);

    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text(
    //       "Alert Dialog",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(color: Colors.green),
    //     ),
    //     content: Text(
    //       message,
    //       softWrap: true,
    //       textAlign: TextAlign.center,
    //     ),
    //     actions: [
    //       FlatButton(
    //           child: Text('OK'),
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => Home(),
    //               ),
    //             );
    //           })
    //     ],
    //   ),
    // );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Detail'),
          backgroundColor: prefix0.appBarColor,
          centerTitle: true,
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
           Image.asset(
           prefix0.bg1,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 70, 25, 16),
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
                      controller: shippingAddress,
                      onChanged: (value) {
                        _formData['s_address'] = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return " Required";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      cursorColor: prefix0.appBarColor,
                      decoration: InputDecoration(
                        prefixIcon: Material(
                          color: Colors.transparent,
                          child: Icon(
                            Icons.home,
                            color: prefix0.appBarColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: prefix0.appBarColor)),
                        contentPadding: const EdgeInsets.all(
                          16.0,
                        ),
                        hintText: "Address",
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: city,
                      onChanged: (value) {
                        _formData['s_city'] = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return " Required";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      cursorColor: prefix0.appBarColor,
                      decoration: InputDecoration(
                        prefixIcon: Material(
                          color: Colors.transparent,
                          child: Icon(
                            Icons.location_city,
                            color: prefix0.appBarColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: prefix0.appBarColor)),
                        contentPadding: const EdgeInsets.all(
                          16.0,
                        ),
                        hintText: "City",
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: state,
                      onChanged: (value) {
                        _formData['s_state'] = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return " State Required";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      cursorColor: prefix0.appBarColor,
                      decoration: InputDecoration(
                        prefixIcon: Material(
                          color: Colors.transparent,
                          child: Icon(
                            Icons.add_location,
                            color: prefix0.appBarColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: prefix0.appBarColor)),
                        contentPadding: const EdgeInsets.all(
                          16.0,
                        ),
                        hintText: "State",
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: country,
                      onChanged: (value) {
                        _formData['s_country'] = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Country Required";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      cursorColor: prefix0.appBarColor,
                      decoration: InputDecoration(
                        prefixIcon: Material(
                          color: Colors.transparent,
                          child: Icon(
                            Icons.my_location,
                            color: prefix0.appBarColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: prefix0.appBarColor)),
                        contentPadding: const EdgeInsets.all(
                          16.0,
                        ),
                        hintText: "Country",
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: zipcode,
                      onChanged: (value) {
                        _formData['s_zipcode'] = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "ZipCode Required";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      cursorColor: prefix0.appBarColor,
                      decoration: InputDecoration(
                        prefixIcon: Material(
                          color: Colors.transparent,
                          child: Icon(
                            Icons.lock,
                            color: prefix0.appBarColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: prefix0.appBarColor)),
                        contentPadding: const EdgeInsets.all(
                          16.0,
                        ),
                        hintText: "ZipCode",
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(height: 16.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(),
                      child: RaisedButton(
                        
                        elevation: 0,
                        highlightElevation: 0,
                        textColor: Colors.white,
                        color: prefix0.appBarColor,
                        onPressed: () => {
                          setState(() {
                            if (formKey.currentState.validate()) {
                              addData(_formData);
                            }
                          })
                        },
                        child: Text("Update"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
