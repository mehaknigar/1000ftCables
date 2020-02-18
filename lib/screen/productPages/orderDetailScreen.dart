import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
 
class OrderDetail extends StatefulWidget {
  final int OrderId;
  final String total;

  OrderDetail(this.OrderId,this.total);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  List data = [];

  void initState() {
    fetchData();
    super.initState();
    
  }

  Future fetchData() async {
    final response = await http
        .get('https://1000ftcables.com/appdata/orderDetail.php?order_id=${widget.OrderId}');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("My Order Detail"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: 90,
                  right: 90,
                ),
                child: Image.network(
                 "https://www.1000ftcables.com/images/detailed/2/cat5e-blue.png?t=1536186605",
                  // width: 300,
                  // height: 250,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      "Product code:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    data[index]["product_code"],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                     // left: 10,
                     right: 45,
                    ),
                    child: Text(
                      "Unit Price:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("\$"+
                    data[index]["price"],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      right: 15,
                    ),
                    child:
                  Text(
                    "Total Price:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  Text("\$"+
                    widget.total,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      right: 5,
                    ),
                    child:
                  Text(
                    "Shipping Address:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  Text(
                    data[index]["s_address"],
                   // data[index]["s_country"],
                  ),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                       right: 18,
                    ),
                    child:
                  Text(
                    "Billing Address:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                  Text(
                    data[index]["b_address"],
                  ),
                   
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
