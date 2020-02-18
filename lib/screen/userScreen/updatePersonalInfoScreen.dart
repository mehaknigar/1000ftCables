import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/widgets/preference.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class updateInfo extends StatefulWidget {
  @override
  _updateInfoState createState() => _updateInfoState();
}

class _updateInfoState extends State<updateInfo> {
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

    fetchData().then((value) {});
  }

  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController company = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();

  Future fetchData() async {
    final response = await http.get(
        'https://1000ftcables.com/appdata/getuserProfile.php?user_id=${_formData['user_id']}');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        _formData['billingdetail'] = data;
      });
      // print(_formData);
    }
  }
 void getUserDetails() async {
    user = await PreferenceManager.getDetails();
    setState(() {});
  }

  Future addData() async {
    var url = "https://1000ftcables.com/appdata/updateuserInfo.php?user_id=${_formData['user_id']}";
    var response = await http.post(url, body: {
      "fname": fname.text,
      "lname": lname.text,
      "company": company.text,
      "phone": phone.text,
      "email": email.text,
    });
    print(response.body);
    Navigator.pop(context); 

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 22,
              left: 22,
            ),
            child: TextFormField(
              controller: fname..text = _formData['user']['firstname'],
              //controller: fname,

              decoration: InputDecoration(
                labelText: "First",
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          new Container(
            margin: const EdgeInsets.only(
              right: 22,
              left: 22,
            ),
            child: new TextField(
              // controller: lname,
              controller: lname..text = _formData['user']['lastname'],
              decoration: InputDecoration(
                labelText: "Last",
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          new Container(
            margin: const EdgeInsets.only(
              right: 22,
              left: 22,
            ),
            child: new TextField(
              // controller: company,
              controller: company..text = _formData['user']['company'],
              decoration: InputDecoration(
                labelText: "Company",
                //hintText: "Company",
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          new Container(
            margin: const EdgeInsets.only(
              right: 22,
              left: 22,
            ),
            child: new TextField(
              //controller: phone,
              controller: phone..text = _formData['user']['phone'],
              decoration: InputDecoration(
                labelText: "Phone",
                //hintText: "Phone",
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          new Container(
            margin: const EdgeInsets.only(
              right: 22,
              left: 22,
            ),
            child: new TextFormField(
              //controller: email,
              controller: email..text = _formData['user']['email'],
              decoration: InputDecoration(
                labelText: "Email",
                //hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            width: 70,
          ),
          Container(
            margin: EdgeInsets.only(
              right: 70,
              left: 70,
            ),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                addData();
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
