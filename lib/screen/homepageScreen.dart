

// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cable/widgets/drawer.dart';
// import 'package:flutter_cable/screen/productPages/shopnowScreen.dart';
// import 'package:flutter_cable/screen/drawerPages/blogScreen.dart';
// import 'package:flutter_cable/screen/drawerPages/aboutUsScreen.dart';
// import 'package:flutter_cable/screen/drawerPages/rateUsScreen.dart';
// import 'package:flutter_cable/screen/drawerPages/followusPageScreen.dart';
// import 'package:flutter_cable/screen/drawerPages/contactScreen.dart';
// import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: MainDrawer(),
//       body: new Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           new Container(
//             decoration: new BoxDecoration(
//               image: new DecorationImage(
//                   image: new AssetImage("Assets/images/BG.png"),
//                   fit: BoxFit.cover),
//             ),
//           ),
//            Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   //height: 60,
//                   margin: const EdgeInsets.only(top: 30),
//                   width: double.infinity,
//                   child: Card(
//                     color: Color(0xff00FFFFFF),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Container(
//                           //margin: const EdgeInsets.only(right: 15, left: 15),
//                           child: IconButton(
//                             onPressed: () {
//                               _scaffoldKey.currentState.openDrawer();
//                             },
//                             icon: Icon(
//                               Icons.menu,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: Image.asset(
//                             'Assets/images/logo.png',
//                             width: 200,
//                             height: 50,
//                           ),
//                         ),
//                         Container(
//                             //margin: const EdgeInsets.only(right: 15, left: 15),
//                            ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 //APPBAR ENDS HERE
//                 //dealy deals
//                 Column(
//                    children: <Widget>[
//                   Container(

//                     margin: const EdgeInsets.only(
//                       top: 10,
//                     ),
//                     // width: double.infinity,
//                     child: GestureDetector(
//                       // onTap: () {
//                       //   navigateToDealydeals(context);
//                       // },
//                       child: Image.asset(
//                         'Assets/images/deals.png',
//                         width: 220,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 150,
//                     margin: const EdgeInsets.only(
//                       top: 10,
//                     ),
//                     // width: double.infinity,
//                     child: GestureDetector(
//                       // onTap: () {
//                       //   navigateToDealydeals(context);
//                       // },
//                       child: Carousel(
//                         images: [
//                           Image.asset(
//                             'Assets/images/dealydeals.png',
//                             width: 150,
//                             height: 120,
//                           ),
//                           // Image.asset(
//                           //   'Assets/images/dealydeals.png',
//                           //   width: 150,
//                           //   height: 120,
//                           // ),
//                           // Image.asset(
//                           //   'Assets/images/dealydeals.png',
//                           //   width: 150,
//                           //   height: 120,
//                           // ),
//                         ],
//                         animationDuration: Duration(milliseconds: 3500),
//                         boxFit: BoxFit.fill,
//                         dotSize: 0.0,

//                         indicatorBgPadding: 0.0,
//                         borderRadius: false,
//                       ),
//                     ),
//                   ),
//                   // Container(
//                   //   height: 15,
//                   //   child: GestureDetector(
//                   //     // onTap: () {
//                   //     //   navigateToDealydeals(context);
//                   //     // },
//                   //     child: Carousel(
//                   //       images: [
//                   //         // Image.asset(
//                   //         //   'Assets/images/1000ft Cat6A Plenum Solid Copper UTP Ethernet Cable.png',
//                   //         // ),
//                   //         // Image.asset(
//                   //         //   'Assets/images/1000ft Cat6A Plenum Solid Copper UTP Ethernet Cable.png',
//                   //         // ),
//                   //         // Image.asset(
//                   //         //   'Assets/images/1000ft Cat6A Plenum Solid Copper UTP Ethernet Cable.png',
//                   //         // ),
//                   //       ],
//                   //       animationDuration: Duration(milliseconds: 1500),
//                   //     ),
//                   //   ),
//                   // ),
//                   // Container(
//                   //   height: 1,
//                   //   margin: EdgeInsets.only(top: 5),
//                   //   color: Colors.white,
//                   // )
//                 ]),
//                 //dealy deals ends here

//                 //shopnow
//                 Container(
//                   height: 130,
//                   //width:500,

//                   margin: const EdgeInsets.only(
//                     top: 10,
//                   ),
//                   width: double.infinity,
//                   child: GestureDetector(
//                     onTap: () {
//                      Navigator.push(context, MaterialPageRoute(builder: (context) => Shopnow()));
//                     },
//                     child: Image.asset(
//                       'Assets/images/1000ft btn.png',
//                     ),
//                   ),
//                 ),
//                 //shopnow ends here

//                 //contact us
//                 Container(
//                   height: 40,
//                   width: double.infinity,
//                   child: Card(
//                       color: Color(0xff40FFFFFF),
//                       child: GestureDetector(
//                           onTap: () {
//                             UrlLauncher.launch("tel://+1 408-934-9349");
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   new Image.asset(
//                                     'Assets/images/Layer.png',
//                                     width: 50,
//                                     height: 30,
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     "(408) 934-9349",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold,
//                                       decoration: TextDecoration.underline,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ))),
//                 ),
//                 Container(
//                  height: 50,
//                  // margin: const EdgeInsets.only( bottom: 15),
//                   width: double.infinity,
//                   child: Card(
//                     color: Color(0xff40FFFFFF),
//                     child: Container(
//                         child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 7.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           new Container(
//                             margin: const EdgeInsets.only(left: 2),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => Blog()));
//                               },
//                               child: Image.asset(
//                                 'Assets/images/blog.png',
//                                 //width: 200,
//                                 height: 30,
//                               ),
//                             ),
//                           ),
//                           new Container(
//                             margin: const EdgeInsets.only(left: 15),
//                             child: GestureDetector(
//                               onTap: () {
//                                Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutus()));
//                               },
//                               child: Image.asset(
//                                 'Assets/images/man.png',
//                                 width: 45,
//                                 height: 30,
//                               ),
//                             ),
//                           ),
//                           new Container(
//                             margin: const EdgeInsets.only(left: 20),
//                             child: GestureDetector(
//                               onTap: () {
//                                Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
//                               },
//                               child: Image.asset(
//                                 'Assets/images/email.png',
//                                 //width: 200,
//                                 height: 30,
//                               ),
//                             ),
//                           ),
//                           new Container(
//                             margin: const EdgeInsets.only(left: 29),
//                             child: GestureDetector(
//                               onTap: () {
//                                Navigator.push(context, MaterialPageRoute(builder: (context) => Followus()));
//                               },
//                               child: Image.asset(
//                                 'Assets/images/social.png',
//                                 height: 30,
//                               ),
//                             ),
//                           ),
//                           new Container(
//                             margin: const EdgeInsets.only(left: 29),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => Rate()));
//                               },
//                               child: Image.asset(
//                                 'Assets/images/like.png',
//                                 height: 30,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
//                   ),
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }

// }
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cable/widgets/drawer.dart';
import 'package:flutter_cable/screen/productPages/shopnowScreen.dart';
import 'package:flutter_cable/screen/drawerPages/blogScreen.dart';
import 'package:flutter_cable/screen/drawerPages/aboutUsScreen.dart';
import 'package:flutter_cable/screen/drawerPages/rateUsScreen.dart';
import 'package:flutter_cable/screen/drawerPages/followusPageScreen.dart';
import 'package:flutter_cable/screen/drawerPages/contactScreen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   
   

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("Assets/images/BG.png"),
                  fit: BoxFit.cover),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                //height: 60,
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                child: Card(
                  color: Color(0xff00FFFFFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        
                        child: IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'Assets/images/logo.png',
                          width: 200,
                          height: 50,
                        ),
                      ),
                      Container(
                        
                        
                      ),
                    ],
                  ),
                ),
              ),

              SingleChildScrollView(
                child: Column(
                   children: <Widget>[
                  Container(
                   
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    // width: double.infinity,
                    child: GestureDetector(
                      // onTap: () {
                      //   navigateToDealydeals(context);
                      // },
                      child: Image.asset(
                        'Assets/images/deals.png',
                        width: 220,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    // width: double.infinity,
                    child: GestureDetector(
                      // onTap: () {
                      //   navigateToDealydeals(context);
                      // },
                      child: Carousel(
                        images: [
                          Image.asset(
                            'Assets/images/dealydeals.png',
                            width: 150,
                            height: 120,
                          ),
                          Image.asset(
                            'Assets/images/dealydeals.png',
                            width: 150,
                            height: 120,
                          ),
                          Image.asset(
                            'Assets/images/dealydeals.png',
                            width: 150,
                            height: 120,
                          ),
                        ],
                        animationDuration: Duration(milliseconds: 1500),
                        boxFit: BoxFit.fill,
                        dotSize: 0.0,
                         
                        indicatorBgPadding: 0.0,
                        borderRadius: false,
                      ),
                    ),
                  ),
                  Container(
                    height: 15,
                    child: GestureDetector(
                      // onTap: () {
                      //   navigateToDealydeals(context);
                      // },
                      child: Carousel(
                        images: [
                          Image.asset(
                            'Assets/images/1000ft Cat6A Plenum Solid Copper UTP Ethernet Cable.png',
                          ),
                          Image.asset(
                            'Assets/images/1000ft Cat6A Plenum Solid Copper UTP Ethernet Cable.png',
                          ),
                          Image.asset(
                            'Assets/images/1000ft Cat6A Plenum Solid Copper UTP Ethernet Cable.png',
                          ),
                        ],
                        animationDuration: Duration(milliseconds: 1500),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(top: 5),
                    color: Colors.white,
                  )
                ]),
              ),
              //dealy deals ends here

              //shopnow
              Container(
                height: 130,
                //width:500,

                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Shopnow()));
                  },
                  child: Image.asset(
                    'Assets/images/1000ft btn.png',
                  ),
                ),
              ),
              //shopnow ends here

              //contact us
              Container(
                height: 40,
                width: double.infinity,
                child: Card(
                    color: Color(0xff40FFFFFF),
                    child: GestureDetector(
                        onTap: () {
                          UrlLauncher.launch("tel://+1 408-934-9349");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Image.asset(
                                  'Assets/images/Layer.png',
                                  width: 50,
                                  height: 30,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "(408) 934-9349",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ))),
              ),
              Container(
               height: 50,
               // margin: const EdgeInsets.only( bottom: 15),
                width: double.infinity,
                child: Card(
                  color: Color(0xff40FFFFFF),
                  child: Container(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Blog()));
                            },
                            child: Image.asset(
                              'Assets/images/blog.png',
                              //width: 200,
                              height: 30,
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: GestureDetector(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutus()));
                            },
                            child: Image.asset(
                              'Assets/images/man.png',
                              width: 45,
                              height: 30,
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
                            },
                            child: Image.asset(
                              'Assets/images/email.png',
                              //width: 200,
                              height: 30,
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 29),
                          child: GestureDetector(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Followus()));
                            },
                            child: Image.asset(
                              'Assets/images/social.png',
                              height: 30,
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 29),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Rate()));
                            },
                            child: Image.asset(
                              'Assets/images/like.png',
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
   
}

