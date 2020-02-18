import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {

   final String name, message;
  
  Reviews(this.name, this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20,),
    child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  bottom: 10,
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  bottom: 30,
                  right: 15,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
    ),
          );

  }
}
