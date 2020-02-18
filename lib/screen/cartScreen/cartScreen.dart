import 'package:flutter/material.dart';
import 'package:flutter_cable/model/CartItem.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';

import 'package:flutter_cable/widgets/preference.dart';
import 'package:flutter_cable/screen/userScreen/loginPageScreen.dart';
import 'package:flutter_cable/widgets/minusPlus.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class Cart extends StatefulWidget {
  final MainModel model;

  Cart({this.model});

  static const routeName = '/cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  //var product;
  Map<String, dynamic> _formData = {};
  List data = [];
  User user;
  MainModel model;
  void initState() {
    super.initState();
    model = ScopedModel.of<MainModel>(context);
    widget.model.getCart();

    _formData['billingdetail'] = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ScopedModelDescendant(
                builder: (BuildContext context, Widget child, MainModel model) {
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
                  return _buildCartList(context, model.getCartItems, model);
                },
              ),
            ),
            ScopedModelDescendant(
                builder: (BuildContext context, Widget child, MainModel model) {
                  if (model.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (model.getCartItems.length == 0) {
                    return Center(
                      //child: Text('No item in cart.'),
                    );
                  }
                  return _CartTotal();
                },
              ),
             
          ],
        ),
      ),
    );
  }

  Widget _buildCartList(
      BuildContext context, List<CartItem> cartItemList, MainModel model) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ...cartItemList.map((c) => _cartItemCard(c)).toList(),
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
        //           '\$ ${model.getCartSubTotal}',
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
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     ScopedModelDescendant(
        //       builder: (BuildContext context, Widget child, MainModel model) {
        //         return Container(
        //           padding: EdgeInsets.all(10),
        //           margin: EdgeInsets.only(
        //             left: 10,
        //             right: 10,
        //           ),
        //           child: RaisedButton(
        //             child: Text(
        //               "Proceed to Shipping",
        //               style: TextStyle(fontSize: 17),
        //             ),
        //             textColor: Colors.white,
        //             onPressed: () {
        //               if (model.getCartTotalWeight >= 150) {
        //                 // flutter defined function
        //                 return showDialog(
        //                   context: context,
        //                   builder: (BuildContext context) {
        //                     // return object of type Dialog
        //                     return AlertDialog(
        //                       title: new Text(
        //                           "Sorry! you cannot place order more than 150 pounds in a one package"),
        //                       // content: new Text("Alert Dialog body"),
        //                       actions: <Widget>[
        //                         // usually buttons at the bottom of the dialog
        //                         FlatButton(
        //                           child: new Text(
        //                             "OK",
        //                             style: TextStyle(
        //                                 fontSize: 17.0,
        //                                 color: Colors.red,
        //                                 fontWeight: FontWeight.w500),
        //                           ),
        //                           onPressed: () {
        //                             Navigator.pop(context);
        //                           },
        //                         ),
        //                       ],
        //                     );
        //                   },
        //                 );
        //               }

        //               PreferenceManager.getDetails().then((user) {
        //                 if (user != null &&
        //                     user.email != null &&
        //                     user.password != null) {
        //                   ScopedModel.of<MainModel>(context)
        //                       .setLoggedInUser(user);
        //                   PreferenceManager.saveDetails(user);
        //                   Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                       builder: (context) => Shipping(
        //                         model: model,
        //                         //code: _formData['billingdetail']['s_zipcode'],
        //                       ),
        //                     ),
        //                   );
        //                 } else
        //                   Navigator.push(context,
        //                       MaterialPageRoute(builder: (context) => Login()));
        //               });
        //             },
        //             color: Colors.blue,
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _cartItemCard(CartItem cartItem) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ScopedModelDescendant(
                builder: (BuildContext context, Widget child, MainModel model) {
                  return GestureDetector(
                      onTap: () {
                        widget.model.deleteCartItemFromCart(cartItem);
                        setState(
                          () {
                            cartItem.quantity;
                          },
                        );
                      },
                      child: Container(
                        height: 20,
                        child: Image.asset(
                          'Assets/images/cross2.jpg',
                        ),
                      ));
                },
              ),
            ],
          ),
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
                        'https://www.1000ftcables.com/images/detailed/2/' +
                            cartItem.image,
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
                        Container(
                          margin: EdgeInsets.only(
                            left: 40,
                            right: 10,
                            top: 10,
                          ),
                          child: Row(
                            children: <Widget>[
                              MinusPlus(
                                quantity: cartItem.quantity,
                                onDecrease: () {
                                  if (cartItem.quantity > 1) {
                                    setState(() {
                                      cartItem.quantity -= 1;
                                    });
                                    widget.model
                                        .updateCartItemQuantity(cartItem);
                                  }
                                },
                                onIncrease: () {
                                  setState(() {
                                    cartItem.quantity += 1;
                                  });
                                  widget.model.updateCartItemQuantity(cartItem);
                                },
                              ),
                            ],
                          ),
                        ),
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
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total: \$${model.getCartSubTotal}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )
                  ],
                );
              },
            ),
            ScopedModelDescendant(
              builder: (BuildContext context, Widget child, MainModel model) {
                return
            Column(
              children: <Widget>[
                FlatButton(
                 onPressed: () {
                      if (model.getCartTotalWeight >= 150) {
                        // flutter defined function
                        return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text(
                                  "Sorry! you cannot place order more than 150 pounds in a one package"),
                              // content: new Text("Alert Dialog body"),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                FlatButton(
                                  child: new Text(
                                    "OK",
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }

                      PreferenceManager.getDetails().then((user) {
                        if (user != null &&
                            user.email != null &&
                            user.password != null) {
                          ScopedModel.of<MainModel>(context)
                              .setLoggedInUser(user);
                          PreferenceManager.saveDetails(user);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Shipping(
                          //       model: model,
                          //       //code: _formData['billingdetail']['s_zipcode'],
                          //     ),
                          //   ),
                         // );
                        } else
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                      });
                    },
                  color: Colors.white,
                  child: Text(
                    'Proceed to Shipping',
                    style: TextStyle(color: Colors.blue,),
                  ),
                ),
              ],
            );
              },
            ),
          ],
        ),
      ),
    );
  }
}
