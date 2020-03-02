import 'package:flutter/material.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';


class Aboutus extends StatefulWidget {

   static const routeName = '/about';
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),

      body: new Stack(
        children: <Widget>[
          new Container(
            // decoration: new BoxDecoration(
            //   image: new DecorationImage(
            //       image: new AssetImage("Assets/images/BG.png"),
            //       fit: BoxFit.cover),
            // ),
          ),
          ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:10,
                right:25,
                left: 25),
              child: Text("Providing high quality networking cables at competitive prices that installers can use with confidence, ease, and comfort.",
              textAlign: TextAlign.justify,
              style: TextStyle( 
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.black,
                                ),),),
                                Container(
                margin: EdgeInsets.only(top:10,
                right:12,
                left: 12),
              child: Text("Since 1994, our goal was to satisfy as many customers as possible with our excellent products and customer service that they will be proud to use.Not just for low voltage installers. Not just for electrical contractors. For everyone.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),),
                                Column(children: <Widget>[
                                  Text("Our story",
                                    style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: appBarColor,
                                )),
                                Container(
                                  child: Image.asset(
                          'Assets/images/aboutus1.png',
                          width: 300,
                          height: 250,
                        ),
                               ),
                               Container(
                                 margin: EdgeInsets.only(top:10,
                right:12,
                left: 12,),
                               child:Text("We specialize in IT infrastructure satisfying hundreds of customers. We have been providing high quality and cost-effective networking solutions since 1994. As a growing company in the heart of Silicon Valley, we have managed to gain a huge amount of trust and appreciation from a large customer base across the country. All of our products comes with a lifetime warranty so that you can remain worry-free about your purchase.",
                                   textAlign: TextAlign.justify,
                                    style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),)
                                ],),
                                Column(children: <Widget>[
                                  Text("Our Promise",
                                    style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color:appBarColor,
                                )),
                                Container(
                                  child: Image.asset(
                          'Assets/images/aboutus2.png',
                          width: 300,
                          height: 250,
                        ),
                               ),
                               Container(
                                 margin: EdgeInsets.only(top:10,
                right:12,
                left: 12,),
                               child:Text("Our promise to you is to provide the type of quality product and service that cannot be found anywhere else. Installers will be happy to work with our cables that come in a sturdy reel in a box allowing for easy pulling. We also have a special Cat6a cable that has a smaller footprint and more flexible which makes it the installer's dream. We sell direct from factory to customer which allows us to pass the savings to you, making our prices one of the lowest in the market.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),)
                                ],)
            ],
          )
        ])
        ],
       ),
      
    );
  }
}
