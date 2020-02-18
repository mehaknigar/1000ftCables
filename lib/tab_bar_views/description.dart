import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String description;
  Description(this.description);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.only(top: 20),
        child: Text(
          description,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
