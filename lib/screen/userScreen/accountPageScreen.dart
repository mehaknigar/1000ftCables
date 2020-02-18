// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_cable/screen/homepageScreen.dart';
// // import 'package:flutter_cable/screen/productPages/myOrdersScreen.dart';
// // import 'package:flutter_cable/screen/userScreen/updateBSAddressScreen.dart';
// // import 'package:flutter_cable/screen/userScreen/updatePersonalInfoScreen.dart';
// // import 'package:flutter_cable/screen/cartScreen/cartScreen.dart';
// // import 'package:flutter_cable/widgets/preference.dart';
// // import 'package:flutter_cable/model/user.dart';
// // import 'package:scoped_model/scoped_model.dart';
// // import 'package:flutter_cable/scoped-models/Model.dart';
// import 'dart:convert';

// import 'package:flutter_cable/model/user.dart';
// import 'package:flutter_cable/scoped-models/Model.dart';
// import 'package:http/http.dart' as http;

// // class Accounts extends StatefulWidget {
// //   @override
// //   _AccountsState createState() => _AccountsState();
// // }

// // class _AccountsState extends State<Accounts> {
// //   List blog = List();
// //   List blogForDisplay = List();
// // User user;
// //   MainModel model;
// //    Map<String, dynamic> _formData = {};
// //   Future<List> fetchData() async {
// //     var response = await http.get(
// //         'http://192.168.10.7/1000ft/getuserProfile.php?user_id=2933');

// //     var notes = List();

// //     if (response.statusCode == 200) {
// //        blog = json.decode(response.body);
// //        print(blog);
// //     }
// //     return notes;
// //   }

// //   @override
// //   void initState() {
    
// //     model = ScopedModel.of<MainModel>(context);
// //     _formData['user'] = model.getLoggedInUser;
// //     _formData['user_id'] = model.getLoggedInUser.user_id;
// //     fetchData().then((value) {
// //       setState(() {
// //         blog.addAll(value);
// //         blogForDisplay = blog;
// //       });
// //     });
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text('Blogs'),
// //           centerTitle: true,
// //         ),
// //         body: FutureBuilder(
// //             future: fetchData(),
// //             builder: (context, blog) {
// //               return Text(blog.toString());}));
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';

// class Profile extends StatefulWidget {
  
//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   bool loggedInPresent = false, loggedIn = false;
//     User user;
//   MainModel model;
//    Map<String, dynamic> _formData = {};
//   @override
//   void initState() {
//     super.initState();
//     ini();
//     model = ScopedModel.of<MainModel>(context);
// _formData['user_id'] = model.getLoggedInUser.user_id;
//     fetchNotes().then((value) {
//       setState(() {
//         order.addAll(value);
//         myOrder = order;
//       });
//     });
//   }

//   void ini() async {
//     // sharedPreferences = await SharedPreferences.getInstance();

//     // setState(() {
//     //   loggedInPresent = sharedPreferences.containsKey('LoggedIn');
//     //   if (loggedInPresent) {
//     //     loggedIn = sharedPreferences.getBool('LoggedIn');
//     //   }
//     // });
//   }

//   void logout() async {
//     // sharedPreferences = await PreferenceManager.removeDetails();
//     Navigator.pop(context);
//   }

//   List order = List();
//   List myOrder = List();

//   Future fetchNotes() async {
//     var response = await http.get(
//         'http://192.168.10.7/1000ft/getuserProfile.php?user_id=${(_formData['user_id']+1)}');
//     var notes = List();
//     if (response.statusCode == 200) {
//       order = json.decode(response.body);
//     }
//     return notes;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: Icon(
//               Icons.home,
//               color: Colors.white,
//             ),
//           )
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
         
//           FutureBuilder(
//             future: fetchNotes(),
//             builder: (context, product) {
//               return product.data == null
//                   ? Container(
//                       alignment: AlignmentDirectional.center,
//                       child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation(Colors.white),
//                           backgroundColor: Colors.indigo),
//                     )
//                   : ListView.builder(
//                       itemCount: myOrder.length,
//                       itemBuilder: (context, index) {
//                         return Text(order[0]['profile_id'].toString()); },
//                     );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_cable/screen/homepageScreen.dart';
import 'package:flutter_cable/screen/productPages/myOrdersScreen.dart';
import 'package:flutter_cable/screen/userScreen/updateBSAddressScreen.dart';
import 'package:flutter_cable/screen/userScreen/updatePersonalInfoScreen.dart';
import 'package:flutter_cable/screen/cartScreen/cartScreen.dart';
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
  List myUser=List();
  User user;
  MainModel model;
  @override
  void initState() {
    super.initState();
    model = ScopedModel.of<MainModel>(context);
    _formData['user'] = model.getLoggedInUser;
    _formData['user_id'] = model.getLoggedInUser.user_id;
     print(_formData);
    // addData(_formData);
    fetchData().then((value) {});
    PreferenceManager.getDetails().then((user) {
      _formData['user'] = user.toJson();
    });
    getUserDetails();
  }

  Future fetchData() async {
    final response = await http.get(
        'http://192.168.10.7/1000ft/getuserProfile.php?user_id=${_formData['user_id']}');

    if (response.statusCode == 200) {
       
      setState(() {
         data = json.decode(response.body);
         myUser = data;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ListView
              // .builder
              (
            children: <Widget>[
              // itemCount: data.length,
              //  shrinkWrap: true,
              // itemBuilder: (BuildContext context, int index) {
              // return
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 300,
                        right: 20,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                      // top: 20,
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
                                            Text(myUser[0]),
                                                                                        Text(
                                            //  _formData['user']['firstname'],
                                              user?.firstname ?? '' ,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .title,
                                            ),
                                            // Container(
                                            //   margin: EdgeInsets.only(
                                            //     top: 3,
                                            //   ),
                                            //   child: Text( user?.lastname ?? '' ,
                                            //       // "\t" +
                                            //       //     _formData['user']
                                            //       //         ['lastname'],
                                            //       //user?.lastname ?? '',
                                            //       style: TextStyle(
                                            //         fontSize: 19,
                                            //         fontWeight: FontWeight.bold,
                                            //         color: Colors.black87,
                                            //       )
                                            //       //     Theme.of(context).textTheme.title,
                                            //       ),
                                            // ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 5,
                                            bottom: 20,
                                          ),
                                          child: Text(
                                            //_formData['user']['email'],
                                             user?.email ?? '',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ScopedModelDescendant(
                                          builder: (BuildContext context,
                                              Widget child, MainModel model) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => Cart(
                                                      model: model,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Column(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.shopping_cart,
                                                  ),
                                                  Text("Cart")
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    myOrders(),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                Icons.border_color,
                                              ),
                                              Text("Orders")
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Icon(
                                              Icons.favorite,
                                            ),
                                            Text("Favourites")
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                                    GestureDetector(
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black45,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => updateInfo(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  user?.email ?? '',
                                  //_formData['user']['email'],
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
                                    GestureDetector(
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black45,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => updateInfo(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  //_formData['user']['phone'],
                                  user?.phone ?? '',
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
                                    GestureDetector(
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black45,
                                      ),
                                      onTap: () {
                                       
                                         Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  updateShippingAddress(),
                                            ),
                                          );
                                        
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                itemCount: data.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                      data[index]["s_address"] +
                                          ",\t" +
                                          data[index]["s_city"] +
                                          ",\t" +
                                          data[index]["s_state"] +
                                          ",\t" +
                                          data[index]["s_country"] +
                                          ",\t" +
                                          data[index]["s_zipcode"],
                                    ),
                                    leading: Icon(Icons.location_city),
                                  );
                                },
                              ),
                               Row(
                                 
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 20,left: 20,bottom: 20,),
                                    child: Text("Add Shipping Address"),
                                  ),
                   
                              ],),
                              
                              Container(
                                color: Colors.grey.shade200,
                                padding: EdgeInsets.all(
                                  8.0,
                                ),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Billing Address".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black45,
                                      ),
                                      onTap: () {
                                        
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  updateShippingAddress(),
                                            ),
                                          );
                                        
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                itemCount: data.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                      data[index]["b_address"] +
                                          ",\t" +
                                          data[index]["b_city"] +
                                          ",\t" +
                                          data[index]["b_state"] +
                                          ",\t" +
                                          data[index]["b_country"] +
                                          ",\t" +
                                          data[index]["b_zipcode"],
                                    ),
                                    leading: Icon(Icons.location_city),
                                  );
                                },
                              ),
                              Row(
                                 
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 20,left: 20,),
                                    child: Text("Add Billing Address"),
                                  ),
                   
                              ],),
                              
                             
                              Container(
                                color: Colors.grey.shade200,
                                margin: EdgeInsets.only(top: 20,),
                                padding: EdgeInsets.all(8.0),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Payment Info".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                     Icon(
                                        Icons.edit,
                                        color: Colors.black45,
                                      ),
                                      
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text("Add your Payment info"),
                                leading: Icon(Icons.location_city),
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
                                      "Shipment Info".toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                     Icon(
                                        Icons.edit,
                                        color: Colors.black45,
                                      ),
                                       
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text("Add your Shipment info"),
                                leading: Icon(Icons.location_city),
                              ),
                              Divider(),
                              ListTile(
                                title: Text("Setting"),
                                subtitle: Text(
                                  "Update/Add your Account Info",
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
                                      builder: (context) => updateShippingAddress(),
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
