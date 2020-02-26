import 'package:flutter/material.dart';
import 'package:flutter_cable/scoped-models/Model.dart';
import 'package:flutter_cable/screen/userScreen/RegisterUserScreen.dart';
import 'package:flutter_cable/widgets/ipaddress.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_cable/widgets/preference.dart';
import 'package:flutter_cable/model/user.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isInAsyncCall = false;
  void initState() {
    super.initState();
    PreferenceManager.getDetails().then((user) {
      if (user != null && user.email != null && user.password != null) {
        makeHttpRequest(user.email, user.password);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue)),
      child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: [Colors.blue, Colors.purple])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.blueGrey])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          width: 30,
                        ),
                        Image.asset(
                          'Assets/images/logo.png',
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.deepPurple,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    30,
                  ),
                ),
                child: TextFormField(
                  onChanged: (String value) {},
                  controller: emailController,
                  cursorColor: Colors.blueAccent,
                  decoration: InputDecoration(
                    hintText: "Email *",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30,
                        ),
                      ),
                      child: Icon(
                        Icons.email,
                        color: Colors.blueAccent,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 13,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    30,
                  ),
                ),
                child: TextFormField(
                  controller: passController,
                  obscureText: true,
                  onChanged: (String value) {},
                  cursorColor: Colors.blueAccent,
                  decoration: InputDecoration(
                    hintText: "Password *",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          30,
                        ),
                      ),
                      child: Icon(
                        Icons.lock,
                        color: Colors.blueAccent,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 13,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        100,
                      ),
                    ),
                    color: Colors.blueAccent,
                  ),
                  child: FlatButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      login();
                    },
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            // Center(
            //   child: Text(
            //     "FORGOT PASSWORD ?",
            //     style: TextStyle(
            //       color: Colors.red,
            //       fontSize: 12,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an Account ? ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterUserScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up ",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
         inAsyncCall: _isInAsyncCall,
      ),
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  void login() {
    setState(() {
      _isInAsyncCall = true;
    });
    String email = emailController.text;
    String password = passController.text;
    makeHttpRequest(email, password);
  }

  void makeHttpRequest(String email, String password) async {
    http.Response response = await http.get(
      "http://${ip}/1000ft/signin.php?email=${emailController.text}&password=${passController.text}",
    );

    Map<String, dynamic> map = jsonDecode(response.body);
    String title = "Valid User";
    if (map['statusCode'] == 200 && map['statusMessage'] == 'AuthorizedUser') {
      Map<String, dynamic> userDetails = map["userDetails"];

      User user = User(
        userDetails['user_id'].toString(),
        userDetails['firstname'].toString(),
        userDetails['lastname'].toString(),
        userDetails['email'].toString(),
        userDetails['password'].toString(),
        userDetails['s_phone'].toString(),
        userDetails['s_address'].toString(),
        userDetails['s_city'].toString(),
        userDetails['s_state'].toString(),
        userDetails['s_country'].toString(),
        userDetails['s_zipcode'].toString(),
      );

      ScopedModel.of<MainModel>(context).setLoggedInUser(user);
      PreferenceManager.saveDetails(user);
      print(user);
      Navigator.pop(context);
      setState(() {
        _isInAsyncCall = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Note : Invalid User'),
          content: Text("Try Again.."),
        ),
      );
      setState(() {
        _isInAsyncCall = false;
      });
    }
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
