import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:practicando_app/screens/ubicacion.dart';

class Usuario {
  final String name;
  final String email;

  Usuario({this.name, this.email});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    print(json['name']);
    return Usuario(
      name: json['name'],
      email: json['email'],
    );
  }
}

Future<Usuario> crearUsuario(String name, String email) async {
  final http.Response response = await http.post(
    "https://intranet.appsuntuario.com/api/crearusuario",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{'name': name, 'email': email}),
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body)['data']);
    return Usuario.fromJson(json.decode(response.body)['data']);
  } else {
    throw Exception('Falló al crear usuario.');
  }
}

class CrearUsuario extends StatefulWidget {
  _CrearUsuario createState() => _CrearUsuario();
}

class _CrearUsuario extends State<CrearUsuario> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  Future<Usuario> _futureUsuario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Formulario usuario", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.white,
      body:  Form(
          key: formkey,
          child: (_futureUsuario==null)?
           Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(30.0),
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 2.0, color: Colors.white),
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Ingresa tu nombre',
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          if (value.length < 4)
                            return "Nombre debe ser mayor que 3 caracteres";
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Ingresa tu correo',
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(),
                            )),
                        validator: (value) {
                          if (!value.contains('@')) return "Email invalido";
                        }),
                    SizedBox(height: 30),
                    SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            elevation: 10.0,
                            padding: EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blueAccent)),
                            color: Colors.blueAccent,
                            child: Text(
                              "Guardar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () {
                              print("Hola${nameController.text}");
                              if (formkey.currentState.validate()) {
                                setState(() {
                                  _futureUsuario = crearUsuario(nameController.text, emailController.text);
                                  });
                              }
                            })),
                    SizedBox(height: 10),
                    SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            elevation: 10.0,
                            padding: EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blueAccent)),
                            color: Colors.redAccent,
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }))
                  ])
                ): FutureBuilder<Usuario>(
                  future: _futureUsuario,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 400,                                         
                        decoration: BoxDecoration(                          
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20.0)                         
                        ),
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.check_circle,size: 80.0, color: Colors.green),
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(child: Text('Usuario creado correctamente', 
                            style: TextStyle(fontSize: 20.0))),
                            SizedBox(height: 20.0),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                              elevation: 10.0,
                              padding: EdgeInsets.all(20.0),
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)
                              ),
                              child: Text(
                                'Nuevo usuario',
                                style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                              ),
                              onPressed: (){
                                Navigator.push(context, 
                                MaterialPageRoute(
                                  builder: (context)=>CrearUsuario())
                                 );
                              }
                             )
                            ),
                            SizedBox(height: 10.0),
                            SizedBox(
                              width: double.infinity,
                              child:RaisedButton(
                              elevation: 10.0,
                              padding: EdgeInsets.all(20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)
                              ),
                              color: Colors.green,                        
                              child: Text(
                                'Regresar a lista',
                                style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                                ),
                              onPressed: (){
                                Navigator.push(context, 
                                MaterialPageRoute(
                                  builder: (context)=>Ubicacion())
                                 );
                                }
                              )  
                            )
                          ]
                        )
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        height: 400,                        
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20.0)                         
                        ),
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.check_circle,size: 80.0, color: Colors.green),
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(child: Text("${snapshot.error}", 
                            style: TextStyle(fontSize: 20.0))),
                            SizedBox(height: 20.0), 
                            SizedBox(
                              width: double.infinity,
                              child:RaisedButton(
                              elevation: 10.0,
                              padding: EdgeInsets.all(20.0),
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)
                              ),
                              child: Text(
                                'Nuevo usuario',
                                style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                                ),
                              onPressed: (){
                                Navigator.push(context, 
                                MaterialPageRoute(
                                  builder: (context)=>CrearUsuario())
                                 );
                                }
                              ),
                            ),                          
                            SizedBox(height: 10.0),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                              elevation: 10.0, 
                              padding: EdgeInsets.all(20.0),
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)
                              ),                            
                              child: Text(
                                'Regresar a lista',
                                style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                                ),
                              onPressed: (){
                                Navigator.push(context, 
                                MaterialPageRoute(
                                  builder: (context)=>Ubicacion())
                                 );
                                }
                              ) 
                            )                                                        
                          ]
                        )
                      );
                    }
                    return Center(
                      child:Container(                        
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,                          
                          children: <Widget>[
                              Text('Registrando...', style: TextStyle(fontSize: 15.0),),
                              SizedBox(height: 10.0,),
                              CircularProgressIndicator(backgroundColor: Colors.black38,)
                          ],
                        )
                      )
                    );
                  },
                )
            ),
    );
  }
}
/*class CrearUsuario extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Formulario usuario", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Form(
          key: formkey,
          child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(30.0),
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 2.0, color: Colors.white),
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Ingresa tu nombre',
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          if (value.length < 4)
                            return "Nombre debe ser mayor que 3 caracteres";
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Ingresa tu correo',
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(),
                            )),
                        validator: (value) {
                          if (!value.contains('@')) return "Email invalido";
                        }),
                    SizedBox(height: 30),
                    SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            elevation: 10.0,
                            padding: EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blueAccent)),
                            color: Colors.blueAccent,
                            child: Text(
                              "Guardar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () {
                              print("Hola${nameController.text}");
                              if (formkey.currentState.validate()) {                                
                               _CrearUsuario(name:nameController.text,email:emailController.text);
                              }
                            })),
                    SizedBox(height: 10),
                    SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            elevation: 10.0,
                            padding: EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blueAccent)),
                            color: Colors.redAccent,
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }))
                  ]))),
    );
  }
}

class _CrearUsuario extends StatelessWidget {
  String name;
  String email;
  _CrearUsuario({this.name,this.email});
  @override
  Widget build(BuildContext context) {
    showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Mensaje'),
                content: Text('¿Esta seguro de eliminar el registro?'),
                actions: <Widget>[
                  FlatButton(child: Text('Si'), onPressed: () {}),
                  FlatButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
    return FutureBuilder<Usuario>(
      future: crearUsuario(this.name,this.email),
      builder: (context, snapshot) {
        print(snapshot.data.email);
        if (snapshot.hasData) {
          showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Mensaje'),
                content: Text('¿Esta seguro de eliminar el registro?'),
                actions: <Widget>[
                  FlatButton(child: Text('Si'), onPressed: () {}),
                  FlatButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {}
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
*/
