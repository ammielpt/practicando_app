import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicando_app/screens/editarusuario.dart';
import 'package:practicando_app/screens/ubicacion.dart';

class Usuario{
  final int id;
  final String name;
  final String email;
  final int activo;
  Usuario({this.id,this.name,this.email,this.activo});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id:json['id'],
      name: json['name'],
      email: json['email'],
      activo: json['activo']
    );    
  }
}

Future<Usuario> activarUsuario(int id, int activo) async{
    final http.Response response = await http.put(
    "https://intranet.appsuntuario.com/api/activarusuario/$id",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, dynamic>{'activo': activo}),
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body)['data']);
    return Usuario.fromJson(json.decode(response.body)['data']);
  } else {
    throw Exception('Falló al desactivar usuario.');
  }
}

class MostrarUsuario  extends StatefulWidget{
  String name;
  String email;
  int id;
  int activo;
  MostrarUsuario({this.id, this.name, this.email,this.activo});
  _MostrarUsuario createState()=>_MostrarUsuario();
}
class _MostrarUsuario extends State<MostrarUsuario> {
  Future<Usuario>_futureActivarUsuario;
  int flag=1; //para activar si esta inactivo
  @override
  Widget build(BuildContext context) {
    String estado="";
    if(widget.activo==1){
      estado='Activo';
      flag=0; // para desactivar si esta activo
    }else{
      estado="Inactivo";
    }
    String accion_estado="";
    if(widget.activo==1){
      accion_estado='Desactivar';
    }else{
      accion_estado="Activar";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario', style: TextStyle(color: Colors.black)),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(30),
        height: 400,
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(blurRadius: 2.0, color: Colors.white),
            ]),
        child: (_futureActivarUsuario==null)?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Codigo',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.id.toString(),
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Nombre',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Estado',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  estado,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Email',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.email,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child:RaisedButton(
                elevation: 10.0,
                padding: EdgeInsets.all(20.0),
                child: Text('Editar', 
                style: TextStyle(color: Colors.white, fontSize:15.0)),
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)),
                onPressed: () {
                  Navigator.push(
                  context,
                   MaterialPageRoute(
                     builder: (context)=>ActualizarUsuario(
                       id:widget.id.toString(),
                       name:widget.name,
                       email: widget.email
                      )
                   ));
                }
            )), 
            SizedBox(
              height: 20,
            ),          
            SizedBox(
              width: double.infinity,
               child: RaisedButton(              
                elevation: 10.0,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  accion_estado,
                  style: TextStyle(color: Colors.white, fontSize:15.0),
                ),
                shape: RoundedRectangleBorder(                  
                  borderRadius: new BorderRadius.circular(18.0)
                ),
                color: Colors.redAccent,
                onPressed: () {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Mensaje'),
                        content: Text('¿Esta seguro '+accion_estado+' el registro?'),
                        actions: <Widget>[
                          FlatButton(
                              child: Text('Si'),
                              onPressed: (){
                                Navigator.of(context).pop();                                
                                setState(() {
                                  _futureActivarUsuario=activarUsuario(widget.id, flag);
                                });                                
                              },
                          ),
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
                }),)
          ],
        ):FutureBuilder<Usuario>(
          future: _futureActivarUsuario,
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
                 Center(child: Text('Usuario actualizado correctamente', 
                 style: TextStyle(fontSize: 20.0))),
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
          }
          else if (snapshot.hasError) {
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
                    Text('Espere...', style: TextStyle(fontSize: 15.0),),
                    SizedBox(height: 10.0,),
                    CircularProgressIndicator(backgroundColor: Colors.black38,)
                ],
              )
            )
          );         
         }
        )
      ),
    );
  }
}