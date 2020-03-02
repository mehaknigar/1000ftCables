import 'package:flutter/material.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/productPages/orderDetailScreen.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
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
  MainModel model;
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
  void getUserDetails() async {
    user = await PreferenceManager.getDetails();
    setState(() {});
  }

  Future fetchData() async {
    final response = await http.get(
        'http://192.168.10.10/1000ft/getUserOrders.php?user_id=${_formData['user_id']}');

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
      appBar: new AppBar(
        title: Text("My Orders"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
         bg1,
          fit: BoxFit.fill,
        ),
        FutureBuilder(
            future: fetchData(),
            builder: (context, product) {
              return data== null ?
               Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.remove_shopping_cart,
                          size: 40,
                        ),
                        Center(
                          child: Text(
                            'No Orders',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    )
                  : data.length == 0
              ? Container(
                  alignment: AlignmentDirectional.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xffe50914))
                  ),
                )
              :ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                           
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
                         
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.local_shipping,color: appBarColor,),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        ( 'Product Code:' +data[index]["product_code"]),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                      ),
                                      // Text(
                                      //   'Price:\$ ' +
                                      //       data[index]["subtotal"].toString()
                                      // ),
                                      
                                       Text(
                                        'Price:' +
                                            (data[index]["price"].toString()
                                                    
                                                
                                      ),
                                      
                                      
                                       )],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        );
                      });
             
            }),
      ],
    )
      
    );
      

  }
}
