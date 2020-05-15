import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(20.0),
            child: Text("Lista de Noticias", style: TextStyle(fontSize: 20.0))),
        Expanded(
            child: ListView(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20.0),
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                      width: 160.0,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.network('https://placeimg.com/200/100/any'),
                            const ListTile(
                              leading: Icon(Icons.album),
                              title: Text('Atento primero puesto')
                            )
                          ],
                        ),
                      )),
                  Container(
                      width: 160.0,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.network('https://placeimg.com/200/100/any'),
                            const ListTile(
                              leading: Icon(Icons.album),
                              title: Text('Atento primero puesto')
                            )
                          ],
                        ),
                      )),
                 Container(
                      width: 160.0,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.network('https://placeimg.com/200/100/any'),
                            const ListTile(
                              leading: Icon(Icons.album),
                              title: Text('Atento primero puesto')
                            )
                          ],
                        ),
                      )),
                  Container(
                      width: 160.0,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.network('https://placeimg.com/200/100/any'),
                            const ListTile(
                              leading: Icon(Icons.album),
                              title: Text('Atento primero puesto')
                            )
                          ],
                        ),
                      )),
                ],
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
             margin: const EdgeInsets.all(20.0),
              height: 330,
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network('https://placeimg.com/640/280/any'),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Atento primero puesto'),
                      subtitle:
                          Text('Atento ocupa primer puesto en feria de...'),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Ver más'),
                          onPressed: () {/* ... */},
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ]))
      ],
    );
  }
}
