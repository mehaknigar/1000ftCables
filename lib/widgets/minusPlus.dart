import 'package:flutter/material.dart';

class MinusPlus extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  MinusPlus({
    this.quantity,
    this.onDecrease,
    this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Container(
            
             
            height: 20,
            width: 40,
            child: RaisedButton(
              onPressed: onDecrease,
              child: Icon(Icons.remove,
              size: 15,),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 20,
            width: 30,
            child: Text(
              '$quantity',
              style: TextStyle(fontSize: 17),
            ),
            decoration: BoxDecoration(border: Border.all()),
          ),
          Container(
            
            height: 20,
            width: 40,
            child: RaisedButton(
              onPressed: onIncrease,
              child: Icon(
                Icons.add,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
