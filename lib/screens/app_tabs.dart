import 'package:flutter/material.dart';
import 'package:practicando_app/screens/contact.dart';
import 'package:practicando_app/screens/home.dart';
import 'package:practicando_app/screens/info.dart';
import 'package:practicando_app/screens/main_info.dart';
import 'package:practicando_app/screens/ubicacion.dart';

class AppTabs extends StatefulWidget {
  AppTabs({Key key}) : super(key: key);
  _AppState createState() => _AppState();
}

class _AppState extends State<AppTabs>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Portal web", style: TextStyle(color: Colors.black),),
             backgroundColor: Colors.transparent,
            elevation: 0.0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(
            color: Colors.black87
            ),
            ),
          body: TabBarView(children: <Widget>[
            Home(),Contact(),MainInfo(),Info(),Ubicacion()
          ]),
          bottomNavigationBar: Material(
              color: Colors.transparent,
              child: TabBar(tabs: <Widget>[
                Tab(icon: Icon(Icons.home, color: Colors.blueAccent)),
                Tab(icon: Icon(Icons.contacts,color: Colors.blueAccent)),
                Tab(icon: Icon(Icons.message, color: Colors.blueAccent)),
                Tab(icon: Icon(Icons.info,color: Colors.blueAccent)),
                Tab(icon: Icon(Icons.map,color: Colors.blueAccent))
              ])),
        ));
  }
}
