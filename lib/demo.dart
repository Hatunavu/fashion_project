import 'dart:developer';

import 'package:flutter/material.dart';
import 'sharedPref.dart';
import 'user.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  SharedPref sharedPref = SharedPref();
  User userSave = User();
  User userLoad = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Name"),
                      onChanged: (value) {
                        //debugger();
                        setState(() {
                          userSave.name = value;
                        });
                      },
                    )),
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Age"),
                      onChanged: (value) {
                        setState(() {
                          userSave.age = value;
                        });
                      },
                    )),
                Container(
                    height: 50.0,
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(hintText: "Location"),
                      onChanged: (value) {
                        setState(() {
                          userSave.location = value;
                        });
                      },
                    )),
              ],
            ),
          ),
          Container(
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    //debugger();
                    sharedPref.save("user", userSave);
                  },
                  child: Text('Save', style: TextStyle(fontSize: 20)),
                ),
                RaisedButton(
                  onPressed: () async {
                    // loadSharedPrefs();
                    // debugger();
                    try {
                      User user = User.fromJson(await sharedPref.read("user"));
                      setState(() {
                        userLoad = user;
                      });
                      //print(userSave.toJson());
                    } catch (exception) {}
                  },
                  child: Text('Load', style: TextStyle(fontSize: 20)),
                ),
                RaisedButton(
                  onPressed: () {
                    sharedPref.remove("user");

                    setState(() {
                      userLoad = User();
                    });
                  },
                  child: Text('Clear', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Name: " + (userLoad.name ?? ""),
                    style: TextStyle(fontSize: 16)),
                Text("Age: " + (userLoad.age ?? ""),
                    style: TextStyle(fontSize: 16)),
                Text("Location: " + (userLoad.location ?? ""),
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
