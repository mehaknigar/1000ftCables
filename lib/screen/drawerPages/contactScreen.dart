import 'package:email_validator/email_validator.dart';
import 'package:flutter_cable/screen/homepageScreen.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:flutter_cable/widgets/ipaddress.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

var p = 408 - 934 - 9349;

class _ContactState extends State<Contact> {
  Map<String, dynamic> _formData = {};
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  Future sendMail() async {
    if ((EmailValidator.validate(email.text)) == true) {
      final response = await http.post(
          "https://1000ftcables.com/appdata/contactUs.php",
          body: <String, dynamic>{
            'name': name.text,
            'email': email.text,
            'message': message.text
          });
      SweetAlert.show(
        context,
        subtitle: "Your mail is sent",
        style: SweetAlertStyle.success,
      );
      name.text = '';
      email.text = '';
      message.text = '';
    } else {
      SweetAlert.show(
        context,
        subtitle: "Email invalid",
        style: SweetAlertStyle.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact us"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(bg1), fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: Card(
                        color: Colors.transparent,
                        child: GestureDetector(
                            onTap: () {
                              UrlLauncher.launch("tel://+1 408-934-9349");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "CALL NOW: 408-934-9349",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Write Us",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                  
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 50, 25, 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: appBarColor,
                            offset: Offset(5, 5),
                            blurRadius: 10.0,
                          )
                        ]),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 14.0),
                        TextFormField(
                          controller: name,
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
                          decoration: InputDecoration(
                            prefixIcon: Material(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.person,
                                color: prefix0.appBarColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: appBarColor)),
                            contentPadding: const EdgeInsets.all(
                              16.0,
                            ),
                            hintText: "Name",
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: email,
                          onChanged: (value) {
                            _formData['email'] = value;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Email Required";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            prefixIcon: Material(
                              color: Colors.transparent,
                              child: Icon(
                                Icons.email,
                                color: prefix0.appBarColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: appBarColor)),
                            contentPadding: const EdgeInsets.all(
                              16.0,
                            ),
                            hintText: "Email",
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: message,
                          onChanged: (value) {
                            _formData['message'] = value;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Your Message...";
                            }
                            return null;
                          },
                          cursorColor: appBarColor,
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
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(),
                          child: RaisedButton(
                            elevation: 0,
                            highlightElevation: 0,
                            textColor: Colors.white,
                            color: appBarColor,
                            onPressed: () => {
                              setState(() {
                                if (formKey.currentState.validate()) {
                                  sendMail();
                                }
                              }),
                            },
                            child: Text("Submit"),
                          ),
                        ),
                      ],
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
