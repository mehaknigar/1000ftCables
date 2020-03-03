import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as card;
import 'package:flutter_cable/model/CartItem.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/cartScreen/payment.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:flutter_cable/widgets/preference.dart';

import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class Checkout extends StatefulWidget {

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Map<String, dynamic> _formData = {};
  List data = [];
  User user;
  MainModel model;
  @override
  void initState() {
    super.initState();
    model = ScopedModel.of<MainModel>(context);

    PreferenceManager.getDetails().then((user) {
      _formData['user'] = user.toJson();
     // fetchData().then((value) {});
      print(_formData['user']);
      _formData['productList'] =
          model.cartItemList.map((c) => c.toJson()).toList();
    });
    getUserDetails();
  }

  // Future fetchData() async {
  //   final response = await http.get(
  //       'https://1000ftcables.com/appdata/getuserProfile.php?user_id=${_formData['user_id']}');

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       data = json.decode(response.body);
  //       _formData['billingdetail'] = data;
  //     });
  //   }
  // }

  void getUserDetails() async {
    user = await PreferenceManager.getDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping'),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: Container(
        child: Column(
          children: [
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
            _CartTotal(
                _formData['user']['s_zipcode'].toString(),
                _formData['user']['s_country'].toString(),
                model.getCartTotalWeight.toString(),
                model.getCartSubTotal,
                _formData['user']['email'],
                _formData['user']['user_id']),
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
        Container(
            //color: Colors.grey.shade200,
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Delivery Address :".toUpperCase(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                // GestureDetector(
                //   child: Icon(Icons.edit, color: Colors.blue),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => UpdateData()));
                //   },
                // ),
              ],
            )),
        ListTile(
          title: Text(
            _formData['user']['s_address'] +
                " ," +
                _formData['user']['s_city'] +
                " ," +
                _formData['user']['s_country'],
          ),
          leading: Icon(
            Icons.local_shipping,
            color: appBarColor,
          ),
        ),
        Container(
            margin: EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Text(
              "Items : ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
        ...cartItemList.map((c) => _cartItemCard(c)).toList(),
      ],
    );
  }

  Widget _cartItemCard(CartItem cartItem) {
    return card.Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //margin: EdgeInsets.only(left: 15 ),
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
                                'Quantity :' +
                                    "  " +
                                    ' \$${cartItem.productPrice}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '  X${cartItem.quantity}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: appBarColor,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatefulWidget {
  final String zipcode, country, weight, email, id;
  final double subtotal;
  _CartTotal(this.zipcode, this.country, this.weight, this.subtotal, this.email,
      this.id);
  @override
  __CartTotalState createState() => __CartTotalState();
}

class __CartTotalState extends State<_CartTotal> {
  // bool loggedInPresent = false, loggedIn = false;
  // SharedPreferences sharedPreferences;
  // String userEmail;

  @override
  void initState() {
    super.initState();
    addShipping().then((value) {});
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Your Order has been Placed!"),
            actions: <Widget>[
              FlatButton(
                child: new Text(
                  "Ok",
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
        });
  }

  void addData(String total, String subTotal) async {
    List formData1;
    print('hi m called');
    MainModel model;
    double price = (double.parse(total) * 100).toDouble();
    model = ScopedModel.of<MainModel>(context);
    formData1 = model.cartItemList.map((c) => c.toJson()).toList();
    await InAppPayments.setSquareApplicationId('sq0idp-0oO2b7vOtlVNE6IpGna-5Q');
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails result) async {
          try {
            await getToken(result);
            await chargeCard(result, price, widget.email);
            InAppPayments.completeCardEntry(onCardEntryComplete: () async {
              var url = await http.get(
                "https://1000ftcables.com/appdata/orderTotal.php?id=${widget.id}&email=${widget.email}&subTotal=${subTotal}&total=${total}",
              );

              for (int i = 0; i < formData1.length; i++) {
                var url = await http.get(
                  "https://1000ftcables.com/appdata/order.php?id=${formData1[i]['productId']}&price=${formData1[i]['productPrice']}&quantity=${formData1[i]['quantity']}&code=${formData1[i]['productCode']}&weight=${formData1[i]['weight']}",
                );
              }
              // checkOut(cartController.items, cartController.totalCartValue);
              // cartController.clear();
              Navigator.pop(context);
              _showDialog();
              // _paymentSuccessDialog(
              //     context, sharedPreferences.getString('Customer_id'));
            });
          } catch (ex) {
            InAppPayments.showCardNonceProcessingError(ex.toString());
          }
        },
        onCardEntryCancel: () {});
  }

  Map<String, dynamic> rates = {};
  Future addShipping() async {
    var headers = {'charset': 'utf-8'};
    var url = "https://wwwcie.ups.com/rest/Rate";
    var request = {
      "UPSSecurity": {
        "UsernameToken": {"Username": "salterz1", "Password": "7lUNulS#"},
        "ServiceAccessToken": {"AccessLicenseNumber": "0D70375730F7D076"}
      },
      "RateRequest": {
        "Request": {
          "RequestOption": "Rate",
          "TransactionReference": {"CustomerContext": "Your Customer Context"}
        },
        "Shipment": {
          "Shipper": {
            "Name": "Shipper Name",
            "ShipperNumber": "Shipper Number",
            "Address": {
              "AddressLine": ["Pink Salt Wall", "761 Mabury Road, Suite 75"],
              "City": "San Jose",
              "StateProvinceCode": "CA",
              "PostalCode": "95133",
              "CountryCode": "US"
            }
          },
          "ShipTo": {
            "Name": "Ship To Name",
            "Address": {
              "PostalCode": "${widget.zipcode}",
              "CountryCode": "${widget.country}"
            }
          },
          "ShipFrom": {
            "Name": "Ship From Name",
            "Address": {
              "AddressLine": ["Pink Salt Wall", "761 Mabury Road, Suite 75"],
              "City": "San Jose",
              "StateProvinceCode": "CA",
              "PostalCode": "95133",
              "CountryCode": "US"
            }
          },
          "Service": {"Code": "02", "Description": "Service Code Description"},
          "Package": {
            "PackagingType": {"Code": "02", "Description": "Rate"},
            "PackageWeight": {
              "UnitOfMeasurement": {"Code": "Lbs", "Description": "pounds"},
              "Weight": "${widget.weight}"
            }
          },
          "ShipmentRatingOptions": {"NegotiatedRatesIndicator": ""}
        }
      }
    };

    var response =
        await http.post(url, body: json.encode(request), headers: headers);
    setState(() {
      rates = json.decode(response.body);
    });
  }

  get getShippingRates {
    return double.parse(rates['RateResponse']['RatedShipment']['TotalCharges']
        ['MonetaryValue']);
  }

  get getTotal {
    return getShippingRates + widget.subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return rates['RateResponse'] == null
        ? Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              backgroundColor: Colors.blue,
            ),
          )
        : Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "SubTotal:  \$" + widget.subtotal.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                Text(
                  "Shipping Rates    \$" +
                      (getShippingRates).toStringAsFixed(2),
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                Text(
                  "Total    \$" + getTotal.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                      height: 50.0,
                      color: appBarColor,
                      child: Text(
                        "Place Order".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => {
                            addData(getTotal.toString(),
                                widget.subtotal.toString()),
                          }),
                )
              ],
            ),
          );
  }
}
