import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class findUs extends StatefulWidget {
  @override
  _findUsState createState() => _findUsState();
}

class _findUsState extends State<findUs> {
  _launchURL() async {
    if (Platform.isIOS) {
      if (await launch(
          'https://www.google.com/maps/place/1000FT+Cables/@37.6970319,-121.812422,17z/data=!3m1!4b1!4m5!3m4!1s0x808fe7a1318d5673:0x54ba955f3af6baa1!8m2!3d37.6970319!4d-121.8102333')) {
        await launch(
            'https://www.google.com/maps/place/1000FT+Cables/@37.6970319,-121.812422,17z/data=!3m1!4b1!4m5!3m4!1s0x808fe7a1318d5673:0x54ba955f3af6baa1!8m2!3d37.6970319!4d-121.8102333');
      } else {
        if (await launch(
            'https://www.google.com/maps/place/1000FT+Cables/@37.6970319,-121.812422,17z/data=!3m1!4b1!4m5!3m4!1s0x808fe7a1318d5673:0x54ba955f3af6baa1!8m2!3d37.6970319!4d-121.8102333')) {
          await launch(
              'https://www.google.com/maps/place/1000FT+Cables/@37.6970319,-121.812422,17z/data=!3m1!4b1!4m5!3m4!1s0x808fe7a1318d5673:0x54ba955f3af6baa1!8m2!3d37.6970319!4d-121.8102333');
        } else {
          throw 'Could not launch https://www.google.com/maps/place/1000FT+Cables/@37.6970319,-121.812422,17z/data=!3m1!4b1!4m5!3m4!1s0x808fe7a1318d5673:0x54ba955f3af6baa1!8m2!3d37.6970319!4d-121.8102333';
        }
      }
    } else {
      const url =
          'https://www.google.com/maps/place/1000FT+Cables/@37.6970319,-121.812422,17z/data=!3m1!4b1!4m5!3m4!1s0x808fe7a1318d5673:0x54ba955f3af6baa1!8m2!3d37.6970319!4d-121.8102333';
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
        title: Text("Find Us"),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("Assets/images/BG.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(2),
                child: Image.asset(
                  'Assets/images/map.png',
                  // width: 300,
                  // height: 180,
                ),
              ),
              Container(
                child: Icon(
                  Icons.mail,
                  color: Colors.green,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                   UrlLauncher.launch("mailto:sales@1000ftcables.com");
                },
                child: Container(
                  //margin: EdgeInsets.all(20),
                  child: Text(
                    "sales@1000ftcables.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.call,
                  color: Colors.green,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  UrlLauncher.launch("tel://+1 800-759-7253");
                },
                child: Container(
                  //margin: EdgeInsets.all(20),
                  child: Text(
                    "800-759-7253",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  UrlLauncher.launch("tel://+1 408-934-9349");
                },
                child: Container(
                  //margin: EdgeInsets.all(20),
                  child: Text(
                    "408-934-9349",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.all(20),
                    child: Text(
                      "Technical Support : ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      UrlLauncher.launch("tel://+1 (510) 573-4577");
                    },
                    child: Container(
                      //margin: EdgeInsets.all(20),
                      child: Text(
                        " (510) 573-4577",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _launchURL();
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 35,
                      ),
                    ),
                    Container(
                      child: Text(
                        "1000FTCABLES,",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "43333 Osgood Road,",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Fremont, CA 94539, USA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
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
