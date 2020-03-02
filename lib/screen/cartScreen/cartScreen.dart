import 'package:flutter/material.dart';
import 'package:flutter_cable/model/CartItem.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/cartScreen/shippingScreen.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';

import 'package:flutter_cable/widgets/preference.dart';
import 'package:flutter_cable/screen/userScreen/loginPageScreen.dart';
import 'package:flutter_cable/widgets/minusPlus.dart';
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
        centerTitle: true,
        backgroundColor: appBarColor,
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
                        height: 22,
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
              // Expanded(
              //   flex: 1,
              //   child: Column(
              //     children: <Widget>[
              //       // Container(
              //       //   margin: const EdgeInsets.only(right: 0, left: 0),
              //       //   child: Image.network(
              //       //     'https://www.1000ftcables.com/images/detailed/2/' +
              //       //         cartItem.image,
              //       //     width: 90,
              //       //     height: 90,
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                       
                        child: Text(
                         'Name :' + "  " + cartItem.productName,
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
                              
                              child: Row(
                                children: <Widget>[
                                  Text(
                                'Quantity :' + "  " + ' \$${cartItem.productPrice}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text('  X${cartItem.quantity}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: appBarColor,
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
                                  ),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Price =',
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
                        return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                           
                            return AlertDialog(
                              title: new Text(
                                  "Sorry! you cannot place order more than 150 pounds in a one package"),
                             
                              actions: <Widget>[
                                
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Checkout(
                           
                              ),
                            ),
                         );
                        } else
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                      });
                    },
                  color: Colors.white,
                  child: Text(
                    'Proceed to Shipping',
                    style: TextStyle(color: appBarColor),
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
