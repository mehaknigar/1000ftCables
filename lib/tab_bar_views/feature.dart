import 'package:flutter/material.dart';

class Feature extends StatelessWidget {
  final String features;

  Feature(this.features);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          left: 40,
          right: 20,
          top: 10,
        ),
        child: Text(
          "=>      " + features,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
