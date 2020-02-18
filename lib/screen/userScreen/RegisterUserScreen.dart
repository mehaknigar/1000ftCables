import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/userScreen/loginPageScreen.dart';
import 'package:http/http.dart' as http;

class RegisterUserScreen extends StatefulWidget {
  @override
  _RegisterUserScreenState createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {

  User user;
  Map<String, dynamic> _formData = {};
   

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> _color = ['Canada', 'United States', 'Curaçao', 'Sint Maarten'];
  String selectedState;
  String selectedShippingState;
  String bCountry;
  String Scountry;

  MainModel model;
  List state = List();

  void initState() {
    super.initState();
     
    this.fetchStates();
   }

  TextEditingController fname = new TextEditingController();
  TextEditingController lname = new TextEditingController();
  TextEditingController company = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController conformpass = new TextEditingController();
  TextEditingController billingfname = new TextEditingController();
  TextEditingController billinglname = new TextEditingController();
  TextEditingController billingphone = new TextEditingController();
  TextEditingController billingaddress = new TextEditingController();
  TextEditingController billingCaddress = new TextEditingController();
  TextEditingController billingcity = new TextEditingController();
  TextEditingController billingcountry = new TextEditingController();
  TextEditingController billingstate = new TextEditingController();
  TextEditingController billingzip = new TextEditingController();
  TextEditingController shippingfname = new TextEditingController();
  TextEditingController shippinglname = new TextEditingController();
  TextEditingController shippingphone = new TextEditingController();
  TextEditingController shippingaddress = new TextEditingController();
  TextEditingController shippingCaddress = new TextEditingController();
  TextEditingController shippingcity = new TextEditingController();
  TextEditingController shippingcountry = new TextEditingController();
  TextEditingController shippingstate = new TextEditingController();
  TextEditingController shippingzip = new TextEditingController();

  // void addData() async {
  //   String message;
  //   if (password.text == conformpass.text) {
  //     var url = "http://${ip}/flutter/registration.php";
  //     var response = await http.post(url, body: {
  //       "fname": fname.text,
  //       "lname": lname.text,
  //       "company": company.text,
  //       "phone": phone.text,
  //       "email": email.text,
  //       "password": password.text,

  //     });
  //     print(response.body);
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => shippingAddress(),
  //       ),
  //     );
  //   } else {
  //     message = "Password do not match!";

  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         content: Text(message),
  //       ),
  //     );
  //   }
  // }

  void addData(Map<String, dynamic> body) async {
    // setState(() {
    //   _isInAsyncCall = true;
    // });
    var url = "http://192.168.10.7/1000ft/registration.php";
    //var url = "https://1000ftcables.com/appdata/registration.php";
    var response = await http.post(url, body: jsonEncode(body));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    ); 
  print(response.body);
    
  }

  Future<String> fetchStates() async {
    var res = await http.get(
      Uri.encodeFull('http://192.168.10.7/1000ft/getCountries.php'),
        // Uri.encodeFull('https://1000ftcables.com/appdata/getCountries.php'),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      state = resBody;
     // print(state);
    });

    return "Sucess";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple,
                      ],
                    ),
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.blueGrey,
                      ],
                    ),
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                       Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10.0),
                    
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                        color: Colors.white,),
                        onPressed: () => Navigator.pop(context),
                      ),
                     
                  ),
                  
                ],
              ),
                      SizedBox(
                        height: 40,
                        width: 30,
                      ),
                      Image.asset(
                        'Assets/images/logo.png',
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.deepPurple,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      controller: fname,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'First Name cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value){
                          _formData['firstname'] = value;
                        },
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "First *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.supervised_user_circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      controller: lname,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Last Name cannot be empty';
                        }
                        return null;
                      },
                      onChanged: ( value) {
                        _formData['lastname'] = value;
                      },
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Last *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.supervised_user_circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Company Name cannot be empty';
                        }
                        return null;
                      },
                      controller: company,
                      onChanged: ( value) {
                        _formData['company'] = value;
                      },
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Company *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.business,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      controller: phone,
                      validator: (String value) {
                       if (value.isEmpty) {
                            return "Telephone Required";
                          }
                          return null;
                        },

                      onChanged: ( value) {
                        _formData['phone'] = value;
                      },
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Phone *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.phone,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      controller: email,
                      validator: (String value) {
                       if (value.isEmpty) {
                            return "Telephone Required";
                          }
                          return null;
                        },
                      onChanged: (value) {
                        _formData['email'] = value;
                      },
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Email *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.email,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      validator: (String value) {
                        if (value.isEmpty || value.length < 6) {
                          return 'Password invalid';
                        }
                        return null;
                      },
                      onChanged: ( value) {
                        _formData['password'] = value;
                      },
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Password *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.lock,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Conform Password",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.lock,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 150,
                  ),
                  child: new Text(
                    "  Billing address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Billing First cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['b_firstname'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "First *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.supervised_user_circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Billing Last cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['b_lastname'] = value;
                      },
                      
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Last *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.supervised_user_circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                       if (value.isEmpty) {
                            return "Telephone Required";
                          }
                          return null;
                        },
                      onChanged: (value) {
                        _formData['b_phone'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Phone *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.phone,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Address cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['b_address'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Address *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.add_location,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Billing city cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['b_city'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "City *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        25,
                      ),
                    ),
                    child: DropdownButtonFormField(

                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Billing Country cannot be empty.';
                        }
                        return null;
                      },
                      items: _color.map(
                        (String category) {
                          return new DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Text(category),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        // do other stuff with _category
                        _formData['b_country'] = value;
                        setState(() {
                          bCountry = value;
                        });
                      },
                      value: bCountry,
                       decoration: InputDecoration(
                          hintText: "Country *",
                         fillColor: Colors.white,
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              25,
                            ),
                          ),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.blueAccent,
                          ),
                        ),
                       border: InputBorder.none,
                        // contentPadding: EdgeInsets.symmetric(
                        //   horizontal: 5,
                        //   vertical: 13,
                        // ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        50,
                      ),
                    ),
                    child: DropdownButtonFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'State is cannot be empty.';
                        }
                        return null;
                      },
                      items: state.map(
                        (item) {
                          return new DropdownMenuItem(
                            value: item['state'].toString(),
                            child: Row(
                              children: <Widget>[
                                Text(item['state']),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        // do other stuff with _category
                        _formData['b_state'] = value;
                        setState(() {
                          selectedState = value;
                        });
                      },
                      value: selectedState,
                      decoration: InputDecoration(
                         fillColor: Colors.white,
                        hintText: "State *",
                       prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.blueAccent,
                          ),
                        ),
                       border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Billing ZipCode cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['b_zipcode'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Zipcode *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.local_post_office,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                 Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 150,
                  ),
                  child: new Text(
                    "Shipping address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Shipping First cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['s_firstname'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "First *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.supervised_user_circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Shipping Last cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['s_lastname'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Last *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.supervised_user_circle,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                       if (value.isEmpty) {
                            return "Telephone Required";
                          }
                          return null;
                        },
                      onChanged: (value) {
                        _formData['s_phone'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Phone *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.phone,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Shpiing Address cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['s_address'] = value;
                      },
                      //obscureText: true,
                     // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Address *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Shipping city cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['s_city'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "City *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: DropdownButtonFormField(
                      
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Shipping Country is cannot be empty.';
                        }
                        return null;
                      },
                      items: _color.map(
                        (String category) {
                          return new DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Text(category),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        // do other stuff with _category
                        _formData['s_country'] = value;
                        setState(() {
                          Scountry = value;
                        });
                      },
                      value: Scountry,
                      decoration: InputDecoration(
                         fillColor: Colors.white,
                        hintText: "Country *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.blueAccent,
                          ),
                        ),
                       border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: DropdownButtonFormField(
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Shipping State is cannot be empty.';
                              }
                              return null;
                            },
                            items: state.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['state']),
                                value: item['state'].toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              // do other stuff with _category
                              _formData['s_state'] = value;
                              setState(() {
                                selectedShippingState = value;
                              });
                            },
                            value: selectedShippingState,
                            decoration: InputDecoration(
                               fillColor: Colors.white,
                              hintText: "State/Province *",
                              prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.location_city,
                            color: Colors.blueAccent,
                          ),
                        ),
                       border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                    child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Shipping ZipCode cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formData['s_zipcode'] = value;
                      },
                      // obscureText: true,
                      // controller: conformpass,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        hintText: "Zipcode *",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                          child: Icon(
                            Icons.local_post_office,
                            color: Colors.blueAccent,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                      ),
                    ),
                  ),
                ),













                SizedBox(
                  height: 25,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            100,
                          ),
                        ),
                        color: Colors.blueAccent,
                      ),
                      child: FlatButton(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            addData(_formData);
                          }
                        },
                      ),
                    )),
                // SizedBox(
                //   height: 20,
                // ),
                // Center(
                //   child: Text(
                //     "FORGOT PASSWORD ?",
                //     style: TextStyle(
                //       color: Colors.red,
                //       fontSize: 12,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an Account ? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In ",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
