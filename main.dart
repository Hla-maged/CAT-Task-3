import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Task());
}

class Task extends StatefulWidget {
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  GlobalKey<FormState> State = new GlobalKey<FormState>();
  bool f = false;
  Color pcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: pcolor,
        appBar: AppBar(
          backgroundColor: Color(0xff4CB6AC),
          leading: Switch(
            value: f,
            onChanged: (val) {
              setState(() {
                f = val;
                (f ? pcolor = Colors.grey.shade900 : pcolor = Colors.white);
              });
            },
          ),
          title: Center(
            child: Text(
                "Sign IN",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
          ),
          
        ),
        body: Column(
          children: [
            Spacer(),
            Image.asset('assets/week 3_ image.png'),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: State,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Username Cannot be empty';
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Username'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Password Cannot be empty';
                          return null;
                        },
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                    ),
                  ]),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: Color(0xff4CB6AC),
                  onPressed: () {},
                  child: Icon(
                    Icons.lock_open,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
