import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(children: <Widget>[
        ListTile(
          leading: Image.network('https://i.pravatar.cc/50'),
          title: Text('Atento primero puesto'),
          subtitle: Text('Atento ocupa primer puesto en feria de...'),
        ),
        Divider(),
        ListTile(
          leading: Image.network('https://i.pravatar.cc/50'),
          title: Text('Atento primero puesto'),
          subtitle: Text('Atento ocupa primer puesto en feria de...'),
        ),
         Divider(),
        ListTile(
          leading: Image.network('https://i.pravatar.cc/50'),
          title: Text('Atento primero puesto'),
          subtitle: Text('Atento ocupa primer puesto en feria de...'),
        )
      ]),
    );
  }
}
