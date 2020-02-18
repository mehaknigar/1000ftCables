import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Contact extends StatefulWidget {
   @override
    
  _ContactState createState() => _ContactState();
}
var p=408-934-9349;
class _ContactState extends State<Contact> {

   

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController message = TextEditingController();

  Future sendMail() async {
  final response = await http.post("https://1000ftcables.com/appdata/contactUs.php", body: <String, dynamic>{
      'fname': fname.text,
      'lname': lname.text,
      'number': number.text,
      'message':message.text,
    });
    print(response.body);
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact us"),
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("Assets/images/BG.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 60,
                  //margin: const EdgeInsets.only(top: 40),
                  width: double.infinity,
                  child: Card(
                      color: Colors.transparent,
                       child: GestureDetector(
                       onTap: ()  {
                            UrlLauncher.launch("tel://+1 408-934-9349");
                       },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "CALL NOW: 408-934-9349",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        //margin: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        //decoration: TextDecoration.underline,
                      ),
                    )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Write Us",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            //decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                new Container(
                  margin: const EdgeInsets.only(right: 22, left: 22),
                  child: new TextField(
                    controller: fname,

                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        labelText: "First",
                        hintText: "First",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                                style: BorderStyle.solid))),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                new Container(
                  margin: const EdgeInsets.only(right: 22, left: 22),
                  child: new TextField(
                    controller: lname,

                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        labelText: "Last",
                        hintText: "Last",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                                style: BorderStyle.solid))),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                new Container(
                  margin: const EdgeInsets.only(right: 22, left: 22),
                  child: new TextField(
                    controller: number,

                    decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.white,
                        labelText: "Phone no",
                        hintText: "Phone no",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.white,
                                style: BorderStyle.solid))),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                new Container(
                  margin: const EdgeInsets.only(right: 22, left: 22),
                  child: new TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    controller: message,

                    decoration: InputDecoration(
                        //contentPadding: const EdgeInsets.symmetric(vertical: 30.0),
                        filled: true,
                        //fillColor: Colors.white,
                        labelText: "Message",
                        hintText: "Message",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                                style: BorderStyle.solid))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 70,
                ),
                new Container(
                  //margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: ()  {
                             sendMail();
                       },
                    child: const Text('Submit',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
