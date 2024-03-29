import 'package:flutter/material.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class Followus extends StatefulWidget {
  static const routeName = '/followus';
  @override
  _FollowusState createState() => _FollowusState();
}

class _FollowusState extends State<Followus> {
  _launchURL() async {
    if (Platform.isIOS) {
      if (await launch(
          'https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured')) {
        await launch(
            'https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured');
      } else {
        if (await launch(
            'https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured')) {
          await launch(
              'https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured');
        } else {
          throw 'Could not launch https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured';
        }
      }
    } else {
      const url =
          'https://www.youtube.com/channel/UCEidahi8gGEAsu2fHJmN_-w/featured';
      if (await launch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  launchfacebook() async {
    if (Platform.isIOS) {
      if (await launch('https://www.facebook.com/1000ftcables')) {
        await launch('https://www.facebook.com/1000ftcables');
      } else {
        if (await launch('https://www.facebook.com/1000ftcables')) {
          await launch('https://www.facebook.com/1000ftcables');
        } else {
          throw 'Could not launch https://www.facebook.com/1000ftcables';
        }
      }
    } else {
      const url = 'https://www.facebook.com/1000ftcables';
      if (await launch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  launchTwitter() async {
    if (Platform.isIOS) {
      if (await launch('https://twitter.com/1000ftcable')) {
        await launch('https://twitter.com/1000ftcable');
      } else {
        if (await launch('https://twitter.com/1000ftcable')) {
          await launch('https://twitter.com/1000ftcable');
        } else {
          throw 'Could not launch https://twitter.com/1000ftcable';
        }
      }
    } else {
      const url = 'https://twitter.com/1000ftcable';
      if (await launch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  launchGPlus() async {
    if (Platform.isIOS) {
      if (await launch('https://www.pinterest.com/1000ftcables/')) {
        await launch('https://www.pinterest.com/1000ftcables/');
      } else {
        if (await launch('https://www.pinterest.com/1000ftcables/')) {
          await launch('https://www.pinterest.com/1000ftcables/');
        } else {
          throw 'Could not launch https://www.pinterest.com/1000ftcables/';
        }
      }
    } else {
      const url = 'https://www.pinterest.com/1000ftcables/';
      if (await launch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  launchInsta() async {
    if (Platform.isIOS) {
      if (await launch('https://www.instagram.com/1000ftcables/?hl=en')) {
        await launch('https://www.instagram.com/1000ftcables/?hl=en');
      } else {
        if (await launch('https://www.instagram.com/1000ftcables/?hl=en')) {
          await launch('https://www.instagram.com/1000ftcables/?hl=en');
        } else {
          throw 'Could not launch https://www.instagram.com/1000ftcables/?hl=en';
        }
      }
    } else {
      const url = 'https://www.instagram.com/1000ftcables/?hl=en';
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
        title: Text("Follow us"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(bg1), fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Text(
              'Follow Us ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              launchTwitter();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'Assets/images/twitter.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              launchInsta();
                            },
                            child: Image.asset(
                              'Assets/images/instagram.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: GestureDetector(
                            onTap: () {
                              _launchURL();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'Assets/images/youtube.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: GestureDetector(
                              onTap: () {
                                launchfacebook();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'Assets/images/facebook.png',
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
