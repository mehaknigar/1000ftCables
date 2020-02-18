import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/widgets/preference.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cable/model/user.dart';

class updateShippingAddress extends StatefulWidget {
  @override
  _updateShippingAddressState createState() => _updateShippingAddressState();
}

class _updateShippingAddressState extends State<updateShippingAddress> {
  User user;
  List data = [];

   

   Map<String, dynamic> _formData = {};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MainModel model;

  void initState() {
    super.initState();
    model = ScopedModel.of<MainModel>(context);

    _formData['user'] = model.getLoggedInUser;
    _formData['user_id'] = model.getLoggedInUser.user_id;

    PreferenceManager.getDetails().then((user) {
      _formData['user'] = user.toJson();
    });
    // getUserDetails();
    fetchData().then((value) {});
  }

  void getUserDetails() async {
    user = await PreferenceManager.getDetails();
    setState(() {});
  }

  Future fetchData() async {
    final response = await http.get(
        'https://1000ftcables.com/appdata/getuserProfile.php?user_id=${_formData['user_id']}');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        //_formData['billingdetail'] = data;
      });
      // print(_formData);
    }
  }

  TextEditingController billingfname = new TextEditingController();
  TextEditingController billinglname = new TextEditingController();
  TextEditingController billingphone = new TextEditingController();
  TextEditingController billingaddress = new TextEditingController();
  TextEditingController billingcity = new TextEditingController();
  TextEditingController billingcountry = new TextEditingController();
  TextEditingController billingstate = new TextEditingController();
  TextEditingController billingzip = new TextEditingController();
  TextEditingController shippingfname = new TextEditingController();
  TextEditingController shippinglname = new TextEditingController();
  TextEditingController shippingphone = new TextEditingController();
  TextEditingController shippingaddress = new TextEditingController();
  TextEditingController shippingcity = new TextEditingController();
  TextEditingController shippingcountry = new TextEditingController();
  TextEditingController shippingstate = new TextEditingController();
  TextEditingController shippingzip = new TextEditingController();

  // Future addData() async {
  //   var url =
  //       "https://1000ftcables.com/appdata/updateBSAdddress.php?user_id=${_formData['user_id']}";
  //   var response = await http.post(url, body: {
  //     "billingfname": billingfname.text,
  //     "billinglname": billinglname.text,
  //     "billingphone": billingphone.text,
  //     "billingaddress": billingaddress.text,
  //     "billingcity": billingcity.text,
  //     "billingCountry": billingcountry.text,
  //     "billingstate": billingstate.text,
  //     "billingzip": billingzip.text,
  //     "shippingfname": shippingfname.text,
  //     "shippinglname": shippinglname.text,
  //     "shippingphone": shippingphone.text,
  //     "shippingaddress": shippingaddress.text,
  //     "shippingcity": shippingcity.text,
  //     "shippingcountry": shippingcountry.text,
  //     "shippingstate": shippingstate.text,
  //     "shippingzip": shippingzip.text,
  //   });
  //   print(response.body);
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Accounts(),
  //     ),
  //   );

  //   print(_formData);
  // }


 void addData(Map<String, dynamic> body) async {
    var url = "https://1000ftcables.com/appdata/updateBSAdddress.php?user_id=${_formData['user_id']}";
    var response = await http.post(url, body: jsonEncode(body));

     Navigator.pop(context);
    //print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Edit Billing and Shipping Address"),
      ),
      body: Form(
        key: _formKey,
        child: ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: new Text(
                    "  Billing address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black54,
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
                    controller: billingfname
                    ..text = data[index]['b_firstname'],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'First Name is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "First",
                    ),
                    onChanged: (value) {
                      _formData['b_firstname'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    controller: billinglname..text = data[index]['b_lastname'],
                     
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Last Name is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Last",
                    ),
                    onChanged: (value) {
                      _formData['b_lastname'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    controller: billingphone..text = data[index]['b_phone'],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Phone no is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Phone",
                    ),
                    onChanged: (value) {
                      _formData['b_phone'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    controller: billingaddress..text = data[index]['b_address'],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Address is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Address",
                    ),
                    onChanged: (value) {
                      _formData['b_address'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    controller: billingcity..text = data[index]['b_city'],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'City is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "City",
                    ),
                    onChanged: (value) {
                      _formData['b_city'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    controller: billingcountry..text = data[index]['b_country'],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Country is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Country",
                    ),
                    onChanged: (value) {
                      _formData['b_country'] = value;
                    },
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(
                //     right: 22,
                //     left: 22,
                //   ),
                //   child: DropdownButtonFormField(
                //     validator: (String value) {
                //       if (value.isEmpty) {
                //         return 'Country is required.';
                //       }
                //       return null;
                //     },
                //     items: _color.map(
                //       (String category) {
                //         return new DropdownMenuItem(
                //           value: category,
                //           child: Row(
                //             children: <Widget>[
                //               Text(category),
                //             ],
                //           ),
                //         );
                //       },
                //     ).toList(),
                //     onChanged: (value) {
                //       // do other stuff with _category
                //       _formData['b_country'] = value;
                //     },
                //     //value: _selectedcolor,
                //     decoration: InputDecoration(
                //       labelText: "Country",
                //     ),
                //   ),
                // ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    controller: billingstate..text = data[index]['b_state'],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'State is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "State/Province",
                    ),
                    onChanged: (value) {
                      _formData['b_state'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Zip code is required.';
                      }
                      return null;
                    },
                    controller: billingzip..text = data[index]['b_zipcode'],
                    decoration: InputDecoration(
                      labelText: "Zip/Postal code",
                    ),
                    onChanged: (value) {
                      _formData['b_zipcode'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                  // width: 0,
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: new Text(
                    "  Shipping address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  // width: 0,
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'First name is required.';
                      }
                      return null;
                    },
                    controller: shippingfname
                      ..text = data[index]['s_firstname'],
                    decoration: InputDecoration(
                      labelText: "First Name",
                    ),
                    onChanged: (value) {
                      _formData['s_firstname'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Last name is required.';
                      }
                      return null;
                    },
                    controller: shippinglname..text = data[index]['s_lastname'],
                    decoration: InputDecoration(
                      labelText: "Last Name",
                    ),
                    onChanged: (value) {
                      _formData['s_lastname'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Phone no is required.';
                      }
                      return null;
                    },
                    controller: shippingphone..text = data[index]['s_phone'],
                    decoration: InputDecoration(
                      hintText: "Phone",
                    ),
                    onChanged: (value) {
                      _formData['s_phone'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Address is required.';
                      }
                      return null;
                    },
                    controller: shippingaddress
                      ..text = data[index]['s_address'],
                    decoration: InputDecoration(
                      labelText: "Address",
                    ),
                    onChanged: (value) {
                      _formData['s_address'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'City is required.';
                      }
                      return null;
                    },
                    controller: shippingcity..text = data[index]['s_city'],
                    decoration: InputDecoration(
                      labelText: "City",
                    ),
                    onChanged: (value) {
                      _formData['s_city'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Country is required.';
                      }
                      return null;
                    },
                    controller: shippingcountry
                      ..text = data[index]['s_country'],
                    decoration: InputDecoration(
                      labelText: "Country",
                    ),
                    onChanged: (value) {
                      _formData['s_country'] = value;
                    },
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(
                //     right: 22,
                //     left: 22,
                //   ),
                //   child: DropdownButtonFormField(
                //     validator: (String value) {
                //       if (value.isEmpty) {
                //         return 'Country is required.';
                //       }
                //       return null;
                //     },
                //     items: _color.map(
                //       (String category) {
                //         return new DropdownMenuItem(
                //           value: category,
                //           child: Row(
                //             children: <Widget>[
                //               Text(category),
                //             ],
                //           ),
                //         );
                //       },
                //     ).toList(),
                //     onChanged: (value) {
                //       // do other stuff with _category
                //       _formData['s_country'] = value;
                //     },
                //     decoration: InputDecoration(
                //       hintText: "Country",
                //     ),
                //   ),
                // ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'State is required.';
                      }
                      return null;
                    },
                    controller: shippingstate..text = data[index]['s_state'],
                    decoration: InputDecoration(
                      labelText: "Province/State",
                    ),
                    onChanged: (value) {
                      _formData['s_state'] = value;
                    },
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 22,
                    left: 22,
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Zip code is required.';
                      }
                      return null;
                    },
                    controller: shippingzip..text = data[index]['s_zipcode'],
                    decoration: InputDecoration(
                      labelText: "Zip/Postal code",
                    ),
                    onChanged: (value) {
                      _formData['s_zipcode'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                  // width: 0,
                ),
                new Container(
                  margin: const EdgeInsets.only(
                    right: 70,
                    left: 130,
                  ),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      addData(_formData);
                      //print(_formData);
                    },
                    child: const Text(
                      '     Save      ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
