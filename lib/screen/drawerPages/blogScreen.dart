import 'package:flutter/material.dart';
//import 'package:flutter_cable/widgets/cart.dart';
//import 'package:youtube_player/youtube_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class Blog extends StatefulWidget {
  static const routeName = '/blog';
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {

  _launchURL() async {
  if (Platform.isIOS) {
    if (await launch('https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured')) {
      await launch('https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured');
    } else {
      if (await launch('https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured')) {
        await launch('https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured');
      } else {
        throw 'Could not launch https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured';
      }
    }
  } else {
    const url = 'https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured';
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
        title: Text("Installation Guide"),
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
            children: <Widget>[
              Container(
                height: 150,
                margin: const EdgeInsets.only(
                  top: 80,
                ),
                width: double.infinity,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      _launchURL();
                    },
                    child: Image.asset(
                      'Assets/images/installation.png',
                      // width: 400,
                      // height: 150,
                    ),
                  ),
                ),
              ),
              Container(
                height: 150,
                margin: const EdgeInsets.only(
                  top: 50,
                ),
                width: double.infinity,
                child: Container(
                  child: GestureDetector(
                    // onTap: () {
                    //   navigatetoshopnow(context);
                    // },
                    child: Image.asset(
                      'Assets/images/information.png',
                      // width: 400,
                      // height: 150,
                    ),
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
