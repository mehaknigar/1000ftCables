import 'package:flutter/material.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/drawerPages/aboutUsScreen.dart';
import 'package:flutter_cable/screen/userScreen/accountPageScreen.dart';
import 'package:flutter_cable/screen/drawerPages/blogScreen.dart';
import 'package:flutter_cable/screen/drawerPages/contactScreen.dart';
import 'package:flutter_cable/screen/drawerPages/findusPageScreen.dart';
import 'package:flutter_cable/screen/drawerPages/followusPageScreen.dart';
import 'package:flutter_cable/screen/drawerPages/rateUsScreen.dart';
import 'package:flutter_cable/screen/productPages/shopnowScreen.dart';
import 'package:flutter_cable/screen/userScreen/loginPageScreen.dart';
import 'package:flutter_cable/widgets/preference.dart';

import 'package:flutter_cable/model/user.dart';
import 'package:scoped_model/scoped_model.dart';

class MainDrawer extends StatefulWidget {
  static const routeName = '/blog';

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
 User user;
 
 Map<String, dynamic> _formData = {};
  List data = [];
   MainModel model;
  @override
  void initState() {
    super.initState();
    // model = ScopedModel.of<MainModel>(context);
    // _formData['user'] = model.getLoggedInUser;
    // _formData['user_id'] = model.getLoggedInUser.user_id;
    // //print(_formData);
    // addData(_formData);
    
    // PreferenceManager.getDetails().then((user) {
    //   _formData['user'] = user.toJson();
    // });
    
  }
 
   

   
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Color(0xff002A5B),
      child: ListView(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            //child: Text(''),
            child: Image.asset(
              'Assets/images/logo_mark_final.png',
            ),
          ),
          Container(
          margin: EdgeInsets.only(top: 2),
          
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 2.0, color: Colors.white),
              
            ),
            color: Colors.white70,
          ),
          
        ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: Text('Account',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
                      PreferenceManager.getDetails().then((user) {
                        if (user != null &&
                            user.email != null ) {
                               ScopedModel.of<MainModel>(context).setLoggedInUser(user);
                               PreferenceManager.saveDetails(user);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Accounts(
                                
                                //code: _formData['billingdetail']['s_zipcode'],
                              ),
                            ),
                          );
                        } else
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                      });
                    },
             
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            title: Text('ShopNow',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Shopnow()));
            },
          ),
           ListTile(
            leading: Image.asset(
              'Assets/images/blog.png',
              //width: 200,
              height: 20,
            ),
            title: Text('Blog',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Blog()));
            },
          ),
          
          ListTile(
            leading: Icon(
              Icons.contact_phone,
              color: Colors.white,
            ),
            title: Text('Contact',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            title: Text('Find Us',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => findUs()));
            },
          ),
           
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: Text('About',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Aboutus()));
            },
          ),
          ListTile(
            leading: Image.asset(
              'Assets/images/social.png',
              //width: 200,
              height: 25,
            ),
            title: Text('Follow',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Followus()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.thumbs_up_down,
              color: Colors.white,
            ),
            title: Text('Rate',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Rate()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Colors.white,
            ),
            title: Text('Share',
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {},
          ),
           
          // ListTile(
          //   leading: Image.asset(
          //     'Assets/images/Vector Smart Object-2.png',
          //     //width: 200,
          //     height: 25,
          //   ),
          //   title: Text('Coupon Code',
          //       style: TextStyle(
          //         color: Colors.white,
          //       )),
          //   onTap: () {},
          // ),
          
        ],
      ),
    ));
  }
}
