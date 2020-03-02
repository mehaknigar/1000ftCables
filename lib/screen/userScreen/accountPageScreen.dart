import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cable/screen/homepageScreen.dart';
import 'package:flutter_cable/screen/productPages/myOrdersScreen.dart';
import 'package:flutter_cable/screen/userScreen/updateData.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:flutter_cable/widgets/preference.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:http/http.dart' as http;

class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
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
    fetchData().then((value) {});
    PreferenceManager.getDetails().then((user) {
      _formData['user'] = user.toJson();
    });
    getUserDetails();
  }

  Future fetchData() async {
    final response = await http.get(
        'https://1000ftcables.com/appdata/getuserProfile.php?user_id=${_formData['user_id']}');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        _formData['billingdetail'] = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/images/BG.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                      top: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16.0),
                              margin: EdgeInsets.only(top: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 96.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              user?.firstname ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .title,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 5,
                                            bottom: 20,
                                          ),
                                          child: Text(
                                            _formData['user']['email'],
                                            // user?.user_id ?? '',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  //     Row(
                                  //       children: <Widget>[
                                  //         Expanded(
                                  //           child: ScopedModelDescendant(
                                  //             builder: (BuildContext context,
                                  //                 Widget child, MainModel model) {
                                  //               return GestureDetector(
                                  //                 onTap: () {
                                  //                   Navigator.push(
                                  //                     context,
                                  //                     MaterialPageRoute(
                                  //                       builder: (context) => Cart(
                                  //                         model: model,
                                  //                       ),
                                  //                     ),
                                  //                   );
                                  //                 },
                                  //                 child: Column(
                                  //                   children: <Widget>[
                                  //                     Icon(
                                  //                       Icons.shopping_cart,
                                  //                     ),
                                  //                     Text("Cart")
                                  //                   ],
                                  //                 ),
                                  //               );
                                  //             },
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           child: GestureDetector(
                                  //             onTap: () {
                                  //               Navigator.push(
                                  //                 context,
                                  //                 MaterialPageRoute(
                                  //                   builder: (context) =>
                                  //                       myOrders(),
                                  //                 ),
                                  //               );
                                  //             },
                                  //             child: Column(
                                  //               children: <Widget>[
                                  //                 Icon(
                                  //                   Icons.border_color,
                                  //                 ),
                                  //                 Text("Orders")
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         // Expanded(
                                  //         //   child: Column(
                                  //         //     children: <Widget>[
                                  //         //       // Icon(
                                  //         //       //   Icons.favorite,
                                  //         //       // ),
                                  //         //       // Text("Favourites")
                                  //         //     ],
                                  //         //   ),
                                  //         // ),
                                  //       ],
                                  //     ),
                                ],
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                    'Assets/images/profile.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                left: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "User information",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.grey.shade200,
                                padding: EdgeInsets.all(8.0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Email".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  _formData['user']['email'],
                                ),
                                leading: Icon(Icons.email),
                              ),
                              Container(
                                color: Colors.grey.shade200,
                                padding: EdgeInsets.all(8.0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Phone".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  _formData['user']['s_phone'],
                                ),
                                leading: Icon(Icons.phone),
                              ),
                              Container(
                                color: Colors.grey.shade200,
                                padding: EdgeInsets.all(8.0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Shipping Address".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              ListView.builder(
                                itemCount: data.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(data[index]["s_address"] +
                                        ",\t" +
                                        data[index]["s_city"] +
                                        ",\t" +
                                        data[index]["s_state"] +
                                        ",\t" +
                                        data[index]["s_country"]),
                                    leading: Icon(Icons.local_shipping),
                                  );
                                },
                              ),
                              ListTile(
                                title: Text("Setting"),
                                subtitle: Text(
                                  "Update Your Account Information",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                leading: Icon(Icons.settings),
                                trailing: Icon(Icons.edit),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateData(),
                                    ),
                                  );
                                },
                              ),
                              ListTile(
                                title: Text("My Orders"),
                                leading: Icon(Icons.local_shipping),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => myOrders(),
                                    ),
                                  );
                                },
                              ),
                              ListTile(
                                title: Text("Sign out"),
                                leading: Icon(Icons.person),
                                onTap: () {
                                  logout();
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ], // },
          ),
        ],
      ),
    );
  }

  void getUserDetails() async {
    user = await PreferenceManager.getDetails();
    setState(() {});
  }

  void logout() async {
    user = await PreferenceManager.removeDetails();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
}
