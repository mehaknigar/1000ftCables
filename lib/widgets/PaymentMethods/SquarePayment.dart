import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
class Square_Payment extends StatefulWidget {
  @override
  _Square_PaymentState createState() => _Square_PaymentState();
}

class _Square_PaymentState extends State<Square_Payment> {



// @override
// void initState() {
//   super.initState();
//    InAppPayments.setSquareApplicationId('sq0idp-Ub9xz0mzfWawh2XtcMiwig');
// }

  void _pay() {
    InAppPayments.setSquareApplicationId(
        'sq0idp-Ub9xz0mzfWawh2XtcMiwig');
    InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
    print(details.nonce); // here you get the nonce
// The following method dismisses the card entry UI
    // It is required to be called 
    InAppPayments.completeCardEntry(
      onCardEntryComplete: () async {
        
      Response response = await get("http://192.168.8.207:8080?nonce=" + details.nonce);

      await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text("Square Payments API Response"),
            content: Text(response.body.toString()),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(ctx);
                },
              ),
            ],
          );
       });
      }
    );
  }, onCardEntryCancel: () {
     print("canceled");
  }
      // onCardEntryCancel: _cardEntryCancel,
      // onCardNonceRequestSuccess: _cardNonceRequestSuccess,
    );
  }

   
   
    

   
//95133  656  1/24   5589 6210 2094 3164
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("payment"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pay,
        tooltip: 'Pay',
        child: Icon(Icons.payment),
      ),
      
    );
  }
}
