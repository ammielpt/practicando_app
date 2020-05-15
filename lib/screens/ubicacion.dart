import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:practicando_app/screens/mostrarusuario.dart';
import 'package:practicando_app/screens/crearusuario.dart';

class Usuario {
  int id;
  String name;
  String email;
  String avatar;
  int activo;
  Usuario({this.id, this.name, this.email, this.avatar,this.activo});
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      activo: json['activo']
    );
  }
}

List<Usuario> parseUsuarios(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}

Future<List<Usuario>> fetchUsuarios(String nombre) async {
  http.Response response;
  if(nombre.length==0){
  response = await http.get('https://intranet.appsuntuario.com/api/listarusuarios');
  }else{
  response=await http.get('https://intranet.appsuntuario.com/api/buscarusuario/$nombre');
  }
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    print('Hola 1 ${json.decode(response.body)['data']}'); // decodifica a formato json
    print('Hola 2 ${json.encode(json.decode(response.body)['data'])}'); // decodifica y codifica a formato json
    return compute(parseUsuarios, json.encode(json.decode(response.body)['data']));
    // return Usuario.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Fallo la carga de usuarios');
  }
}

class Ubicacion extends StatefulWidget {
  Ubicacion({Key key}) : super(key: key);
  @override
  _UbicacionState createState() => _UbicacionState();
}

class _UbicacionState extends State<Ubicacion>
    with AutomaticKeepAliveClientMixin<Ubicacion> {
  @override
  bool get wantKeepAlive => true;
  Future<List<Usuario>> futureUsarios;
  List usuarios=[];
  List filteredUsuarios=[];
  @override
  void initState() {
    super.initState();
    futureUsarios = fetchUsuarios("");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          "Lista de usuarios",
          style: TextStyle(
              color: Colors.black87.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0)
                  )
                ),
                filled: true,
                fillColor: Colors.white60,
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Buscar'
              ),
             onChanged: (value){
               setState(() {
                 futureUsarios = fetchUsuarios(value);
               });
             },
        ),
        /*Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xffEFEFEF),
              borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: <Widget>[
              Icon(Icons.search),
              SizedBox(width: 10),
              TextField(
                hintText:'Buscar',
                style: TextStyle(color: Colors.grey, fontSize: 19),
              )
            ],
          ),
        ),*/
        SizedBox(
          height: 40,
        ),
        Container(
          child: FutureBuilder<List<Usuario>>(
          future: futureUsarios,
          builder: (context, snapshot) {
            List<Usuario> lista = snapshot.data;                     
            if (snapshot.hasData) {              
              for (var i = 0; i < lista.length; i++) {                
                print(lista[i].avatar);
              }
              return ListaUsuarios(
                usuarios: lista,
              );
              /*return ListTile(
                title: Text(lista[0].name),
                subtitle: Text(lista[0].email),
              );*/
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        )),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CrearUsuario())); // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class ListaUsuarios extends StatefulWidget {
  List<Usuario> usuarios;
  ListaUsuarios({this.usuarios});
  _ListaUsuarios createState() => _ListaUsuarios();
}

class _ListaUsuarios extends State<ListaUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: widget.usuarios.length,
            itemBuilder: (context, index) {
              String estado="";
              if(widget.usuarios[index].activo==1)
              {estado= '\nActivo';}
              else{
                estado= '\nInactivo';
              }
              return GestureDetector(
                child: Card(                 
                    child: Column(                      
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                        contentPadding: EdgeInsets.all(15.0),
                        leading: Image.network(
                         widget.usuarios[index].avatar.contains('avatar-default')?
                        'https://intranet.appsuntuario.com/storage/avatar-default.jpg':
                        'https://intranet.appsuntuario.com/storage/${widget.usuarios[index].avatar.split("/")[1]}'
                        ),
                        title: Text(widget.usuarios[index].name),
                        subtitle: Text(widget.usuarios[index].email+estado),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MostrarUsuario(
                                        id: widget.usuarios[index].id,
                                        name: widget.usuarios[index].name,
                                        email: widget.usuarios[index].email,
                                        activo: widget.usuarios[index].activo
                              )));
                        }),
                      ]
                    ),
                )               
              );
              /*return ListTile(
                title: Text(widget.usuarios[index].name),
                subtitle: Text(widget.usuarios[index].email),
              );*/
            }));
  }
}
