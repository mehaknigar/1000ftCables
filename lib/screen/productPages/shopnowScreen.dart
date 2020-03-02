import 'package:flutter/material.dart';
import 'package:flutter_cable/screen/catagoriesScreens/cablemanagmentScreen.dart';
import 'package:flutter_cable/screen/catagoriesScreens/cat5Screen.dart';
import 'package:flutter_cable/screen/catagoriesScreens/cat6Screen.dart';
import 'package:flutter_cable/screen/catagoriesScreens/cat6AScreen.dart';
import 'package:flutter_cable/screen/catagoriesScreens/coaxialcableScreen.dart';
import 'package:flutter_cable/screen/catagoriesScreens/fibertestingScreen.dart';
import 'package:flutter_cable/screen/catagoriesScreens/patchcordsScreen.dart';
import 'package:flutter_cable/screen/catagoriesScreens/satellitetvScreen.dart';
import 'package:flutter_cable/screen/catagoriesScreens/tools&equipmentScreen.dart';

class Shopnow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "Assets/images/BG.png",
            fit: BoxFit.fill,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'Assets/images/logo.png',
                      width: 280,
                    ),
                  ],
                ),
              ),
              Divider(
                // height: 600,
                color: Colors.white,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Cat5Bulk(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/2/cat5e-blue.png?t=1536186605',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Cat5 Bulk Cables",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Cat6Bulk(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/1/cat6-riser-bare-copper-blue_-_Copy.png?t=1562603734',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Cat6 Bulk Cables",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Cat6ABulk(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/2/8,8_6tfa-dn.png?t=1533148107',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Cat6A Bulk Cables",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PatchCords(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/0/cat_6_patch_cords137413497551e7a2bf5b023.jpg?t=1438479395',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Patch Cords",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CoaxialCable(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/0/rfc400uf_2.gif?t=1438479406',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Coaxial Cable",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CableManagment(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/0/H-06-010.png?t=1438479396',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Cables Managment",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FiberTestingTool(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/0/KIT-M2-D285xx-L213xx1379407331523815e3c0748.png?t=1438479400',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Fiber Testing Tools",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ToolsEquipment(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/0/CPK1000IL.png?t=1438479402',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Tools & Equipment",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SatelliteTVAccessories(),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://www.1000ftcables.com/images/detailed/2/DP21_Dish_Network_Multi_Switch.jpg?t=1476377520',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Satellite TV Accessories",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
