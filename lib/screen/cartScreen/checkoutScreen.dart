import 'dart:convert';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/screen/productPages/myOrdersScreen.dart';
import 'package:flutter_cable/screen/userScreen/updateBSAddressScreen.dart';
import 'package:flutter_cable/widgets/PaymentMethods/SquarePayment.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cable/model/CartItem.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/widgets/preference.dart';
import 'package:http/http.dart' as http;
 

class CheckOut extends StatefulWidget {
  final MainModel model;
  final total;
  final totalPayable;
  final tax;
  CheckOut({this.model,this.total,this.totalPayable,this.tax});

   

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List data = [];
  MainModel model;
  User user;
  //var product;
  Map<String, dynamic> _formData = {};
 
    
  void initState() {
    super.initState();
    widget.model.getCart(updateCartItem: false);
    model = ScopedModel.of<MainModel>(context);
     _formData['subTotal'] = model.getCartSubTotal;
      _formData['TotalAmount'] = widget.totalPayable;
    _formData['productList'] =
        model.cartItemList.map((c) => c.toJson()).toList();
    _formData['user'] = model.getLoggedInUser;
    _formData['user_id'] = model.getLoggedInUser.user_id;
    fetchData().then((value) {});
    PreferenceManager.getDetails().then((user) {
      _formData['user'] = user.toJson();
    });
    
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

  

  void addData(Map<String, dynamic> body) async {
    var url = "https://1000ftcables.com/appdata/order.php";
    var response = await http.post(url, body: jsonEncode(body));
    print(response.body);
  }

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Payment"),
      ),
      body: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ScopedModelDescendant(
                      builder: (BuildContext context, Widget child,
                          MainModel model) {
                        if (model.isLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (model.getCartItems.length == 0) {
                          return Center(
                            child: Text('No item in cart.'),
                          );
                        }
                        return _buildCartList(
                            context, model.getCartItems, model);
                      },
                    ),
                  ),
                  // ScopedModelDescendant(
                  //   builder:
                  //       (BuildContext context, Widget child, MainModel model) {
                  //     if (model.isLoading) {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //     if (model.getCartItems.length == 0) {
                  //       return Center(
                  //           //child: Text('No item in cart.'),
                  //           );
                  //     }
                  //     // return _shippingTotal(
                  //     //   // total: getTotal.toString(),
                  //     //   // totalPayable: getTotalPayableAmount.toString(),
                  //     //   // tax: getCalculatedGST.toString(),
                  //     //   // shipping: getShippingRates.toString(),
                  //     // );

                  //     //return _shippingTotal( getTotal.toString(), getTotalPayableAmount.toString(), getCalculatedGST.toString());
                  //   },
                  // ),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.blue,
        child: SizedBox(
      height: 50,
      child: Container(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //SizedBox(width: 24),
            ScopedModelDescendant(
              builder: (BuildContext context, Widget child, MainModel model) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "CA State Tax(9.25): \$" 
                      + widget.tax,
                      
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      'Total: \$' +_formData['TotalAmount'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                );
              },
            ),
             Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                         addData(_formData);
                         _showDialog();
                         print(_formData);
                      },
                      color: Colors.white,
                      child: Text(
                        'Place Order',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
               
          ],
        ),
      ),
    ),
      ),
    );
  }

  Widget _buildCartList(
      BuildContext context, List<CartItem> cartItemList, MainModel model) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(8.0),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Billing Address".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.edit,
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => updateShippingAddress(),
                  //   ),
                 // );
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
        Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(8.0),
          width: double.infinity,
          child: Text(
            "Payment Option".toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => stripeMethod(),
        //       ),
        //     );
        //   },
        //   child: ListTile(
        //     title: Text("Stripe Payment"),
        //     leading: Icon(Icons.payment),
        //   ),
        // ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => Pay(),
        //       ),
        //     );
        //   },
        //   child: ListTile(
        //     title: Text("Braintree payent"),
        //     leading: Icon(Icons.payment),
        //   ),
        // ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Square_Payment(),
              ),
            );
          },
          child: ListTile(
            title: Text("Pay with Credit Cards"),
            leading: Icon(Icons.payment),
          ),
        ),
         Container(
            margin: EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Text(
              "Items",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
        ...cartItemList.map((c) => _cartItemCard(c)).toList(),
        // Card(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Container(
        //         padding: EdgeInsets.only(left: 10, right: 10),
        //         child: Text(
        //           ' Sub Total + Shipping fee',
        //           style: TextStyle(
        //             fontSize: 15,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //       Container(
        //         padding:
        //             EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 20),
        //         child: Text(  
        //           "\$" +widget.total,
        //            style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Card(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Container(
        //         padding: EdgeInsets.only(left: 10, right: 10),
        //         child: Text(
        //           'CA State Tax(9.25)',
        //           style: TextStyle(
        //             fontSize: 15,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //       Container(
        //         padding:
        //             EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 20),
        //         child: Text(
        //           "\$" + widget.tax,
                  
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Card(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Container(
        //         padding: EdgeInsets.only(left: 10, right: 10),
        //         child: Text(
        //           'Total',
        //           style: TextStyle(
        //             fontSize: 15,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //       Container(
        //         padding:
        //             EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 20),
        //         child: Text(
        //           "\$" +widget.totalPayable,
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
         
      ],
    );
  }

  Widget _cartItemCard(CartItem cartItem) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 0, left: 0),
                      child: Image.network(
                        'https://www.1000ftcables.com/images/detailed/2/'+ cartItem.image,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.only(left: 15 ),
                      child: Text(
                        cartItem.productName,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                                // left: 15,
                                // right: 70,
                                ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '  \$${cartItem.productPrice}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  '  X${cartItem.quantity}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //     left: 40,
                        //     right: 10,
                        //     top: 10,
                        //   ),
                        //   child: Row(
                        //     children: <Widget>[
                        //       MinusPlus(
                        //         quantity: cartItem.quantity,
                        //         onDecrease: () {
                        //           if (cartItem.quantity > 1) {
                        //             setState(() {
                        //               cartItem.quantity -= 1;
                        //             });
                        //             widget.model
                        //                 .updateCartItemQuantity(cartItem);
                        //           }
                        //         },
                        //         onIncrease: () {
                        //           setState(() {
                        //             cartItem.quantity += 1;
                        //           });
                        //           widget.model.updateCartItemQuantity(cartItem);
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                                // left: 15,
                                // right: 70,
                                ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '=',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '\$${cartItem.getTotal}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Your order has been placed"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text(
                "View Order",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => myOrders(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}




// class _shippingTotal extends StatelessWidget {

    
//   // final String total;
//   // final String tax;
//   // final String totalPayable;
//   // final String shipping;
//   // _shippingTotal({this.total, this.tax, this.totalPayable, this.shipping});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: Container(
//         color: Colors.blue,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             //SizedBox(width: 24),
//             ScopedModelDescendant(
//               builder: (BuildContext context, Widget child, MainModel model) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "Shipping:  \$" + shipping,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 11,
//                       ),
//                     ),
//                     Text(
//                       'Total: \$' +_formData['TotalAmount'],
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   ],
//                 );
//               },
//             ),
//             ScopedModelDescendant(
//               builder: (BuildContext context, Widget child, MainModel model) {
//                 return Column(
//                   children: <Widget>[
//                     FlatButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CheckOut(
//                               model: model,
//                               total: total,
//                               totalPayable: totalPayable,
//                               tax: tax,
//                             ),
//                           ),
//                         );
//                       },
//                       color: Colors.white,
//                       child: Text(
//                         'Place Order',
//                         style: TextStyle(
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


 