import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/pages/search_page.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//       create: (context) {
//         return WeatherProvider();
//       },
//       child: WeatherApp()));
// }

// class WeatherApp extends StatelessWidget {
//   WeatherModel? DATA;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           primarySwatch: Provider.of<WeatherProvider>(context).DATA == null
//               ? Colors.blue
//               : Provider.of<WeatherProvider>(context).DATA!.getColor()),
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }

void main() {
  runApp(Task());
}

class Task extends StatefulWidget {
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  GlobalKey<FormState> State = new GlobalKey<FormState>();
  ThemeMode mode = ThemeMode.dark;
  void Theme(bool on) {
    setState(() {
      mode = on ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff4CB6AC),
          actions: [
            Switch(
              value: mode == ThemeMode.light,
              onChanged: Theme,
            ),
          ],
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
            Image.asset('assets/images/week 3_ image.png'),
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
