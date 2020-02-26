import 'package:flutter/material.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/productPages/orderDetailScreen.dart';
import 'package:flutter_cable/widgets/preference.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
 
class myOrders extends StatefulWidget {
  //  final int UserId;

  // myOrders(this.UserId);
  @override
  _myOrdersState createState() => _myOrdersState();
}

class _myOrdersState extends State<myOrders> {
  Map<String, dynamic> _formData = {};

  List data = [];
User user;
String id;
  MainModel model;
   void initState() {
    super.initState();
    model = ScopedModel.of<MainModel>(context);
    _formData['user'] = model.getLoggedInUser;
    _formData['user_id'] = model.getLoggedInUser.user_id;
    //print(_formData);
    // addData(_formData);
    fetchData().then((value) {});
    PreferenceManager.getDetails().then((user) {
      _formData['user'] = user.toJson();
    });
     
  }

  Future fetchData() async {
    final response = await http.get(
        'https://1000ftcables.com/appdata/getUserOrders.php?user_id=${_formData['user_id']}');

    if (response.statusCode == 200) {
       
      setState(() {
         data = json.decode(response.body);
       // _formData['billingdetail'] = data;
      });
      
    }
  }
   

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("My Orders"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetail(
                      data[index]["order_id"],
                      data[index]["total"].toString(),
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image.network(
                 "https://www.1000ftcables.com/images/detailed/2/cat5e-blue.png?t=1536186605",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            //vertical: 20,
                            horizontal: 5,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            data[index]["product_code"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Total Price:   \$' + data[index]["total"],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Unit Price:   \$' + data[index]["price"].toString(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                    
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
