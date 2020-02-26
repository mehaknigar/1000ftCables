import 'package:flutter/material.dart';
import 'package:flutter_cable/model/CartItem.dart';
import 'package:flutter_cable/model/user.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/userScreen/updateBSAddressScreen.dart';
import 'package:flutter_cable/widgets/preference.dart';

import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';

class Checkout extends StatefulWidget {
  // final MainModel model;
  // Checkout({this.model});
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Map<String, dynamic> _formData1 = {};

  User user;
  MainModel model;
  @override
  void initState() {
    super.initState();
    model = ScopedModel.of<MainModel>(context);

    PreferenceManager.getDetails().then((user) {
      _formData1['user'] = user.toJson();
      print(_formData1['user']);
      _formData1['productList'] =
        model.cartItemList.map((c) => c.toJson()).toList();
    });
    getUserDetails();
  }

  void getUserDetails() async {
    user = await PreferenceManager.getDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.getCartTotalWeight.toString()),
        centerTitle: true,
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
                _formData1['user']['s_zipcode'].toString(),
                _formData1['user']['s_country'].toString(),
                model.getCartTotalWeight.toString(),
                model.getCartSubTotal,_formData1['user']['email'],_formData1['user']['user_id']),
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
              color: Colors.grey.shade200,
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Delivery Address".toUpperCase()),
                  GestureDetector(
                    child: Icon(Icons.edit, color: Colors.red),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => UpdateData()));
                    },
                  ),
                ],
              )),
        ListTile(
          title: Text(
            _formData1['user']['s_address'] +
                " ," +
                _formData1['user']['s_city'] +
                " ," +
                _formData1['user']['s_country'],
          ),
          leading: Icon(Icons.local_shipping),
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

class _CartTotal extends StatefulWidget {
  final String zipcode, country, weight,email, id;
  final double subtotal;
  _CartTotal(this.zipcode, this.country, this.weight, this.subtotal,this.email,this.id);
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
          title: new Text("Your order has been placed"),
         
          actions: <Widget>[
           
            FlatButton(
              child: new Text(
                "View Order",
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.red,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {
               Navigator.pop(context, true);
                  
                
              },
            ),
          ],
      );
      }
     ) ;}
  


void addData(String total,String subTotal) async {
  List formData1;
  MainModel model;
  print(widget.id);
  print(widget.email);
    model = ScopedModel.of<MainModel>(context);
  formData1 =  model.cartItemList.map((c) => c.toJson()).toList();
 var url = await http.get("http://192.168.10.11/1000ft/orderTotal.php?id=${widget.id}&email=${widget.email}&subTotal=${subTotal}&total=${total}",
           ); 

        for(int i=0;i<formData1.length;i++){
          var url = await http.get("http://192.168.10.11/1000ft/order.php?id=${formData1[i]['productId']}&price=${formData1[i]['productPrice']}&quantity=${formData1[i]['quantity']}&code=${formData1[i]['productCode']}&weight=${formData1[i]['weight']}",
           );
         

         }
    
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
                      color: Colors.blue,
                      child: Text(
                        "Place Order".toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => {
                        addData(getTotal.toString(), widget.subtotal.toString()),
                      }),
                )
              ],
            ),
          );
  }
}
