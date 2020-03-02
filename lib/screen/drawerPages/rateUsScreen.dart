import 'package:flutter/material.dart';
import 'package:flutter_cable/screen/drawerPages/reviewsScreen.dart';
import 'package:flutter_cable/screen/drawerPages/testimonialScreen.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class Rate extends StatefulWidget {
  static const routeName = '/rate';
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  rateUs() async {
  if (Platform.isIOS) {
    if (await launch('https://play.google.com/store/apps/details?id=com.skylite.x1000ftcables')) {
      await launch('https://play.google.com/store/apps/details?id=com.skylite.x1000ftcables');
    } else {
      if (await launch('https://play.google.com/store/apps/details?id=com.skylite.x1000ftcables')) {
        await launch('https://play.google.com/store/apps/details?id=com.skylite.x1000ftcables');
      } else {
        throw 'Could not launch https://play.google.com/store/apps/details?id=com.skylite.x1000ftcables';
      }
    }
  } else {
    const url = 'https://play.google.com/store/apps/details?id=com.skylite.x1000ftcables';
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(bg1),
                  fit: BoxFit.cover),
            ),
          ),
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                 
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 30,
                  right: 30,
                ), 
                 
                  child: GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Testimonial()));
                    },
                    child: Image.asset(
                      'Assets/images/testimonial.png',
                      
                    ),
                  ),
                 
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                width: double.infinity,
                
                  child: GestureDetector(
                    onTap: () {
                      rateUs();
                    },
                    child: Image.asset(
                      'Assets/images/Andriod.png',
                     
                    ),
                  ),
                 
              ),
              Container(
                
                margin: const EdgeInsets.only(
                  bottom: 50,
                  left: 30,
                  right: 30,
                ),
               
                
                  child: GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Reviews()));
                    },
                    child: Image.asset(
                      'Assets/images/review.png',
                      
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
