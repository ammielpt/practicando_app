import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practicando_app/screens/ubicacion.dart';

class Usuario{
  final int id;
  final String name;
  final String email;
  Usuario({this.id,this.name,this.email});

  factory Usuario.fromJson(Map<String, dynamic> json) { 
    print(json['name']);   
    return Usuario(
      id:json['id'],
      name: json['name'],
      email: json['email'],
    );    
  }
}

Future<Usuario> actualizarUsuario(String id, String name, String email) async{
    final http.Response response = await http.put(
    "https://intranet.appsuntuario.com/api/actualizarusuario/"+id,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{'name': name, 'email': email}),
  );
  if (response.statusCode == 200) {
    print(json.decode(response.body)['data']);
    return Usuario.fromJson(json.decode(response.body)['data']);
  } else {
    throw Exception('Falló al actualizar usuario.');
  }
}

class ActualizarUsuario extends StatefulWidget{
  final String id;
  final String name;
  final String email;
  ActualizarUsuario({this.id,this.name,this.email});
  _ActualizarUsuario createState()=>_ActualizarUsuario();
}

class _ActualizarUsuario extends State<ActualizarUsuario>{
  final GlobalKey<FormState>formkey=GlobalKey<FormState>(); 
  Future<Usuario>_futureActualizarUsuario;
  @override
  Widget build(BuildContext context) { 
  final idController = TextEditingController(text: widget.id);
  final nameController= TextEditingController(text: widget.name);
  final emailController= TextEditingController(text: widget.email);    
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario usuario',style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color:Colors.black87)
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: (_futureActualizarUsuario==null)?
           Container(
             padding: EdgeInsets.all(20.0),
             margin: EdgeInsets.all(20.0),
             height: 500,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30.0),
               color: Colors.white,
               boxShadow: [
                 BoxShadow(blurRadius: 2.0, color:Colors.white)
               ],               
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: <Widget>[
                 Text("Actualizar usuario", style: TextStyle(fontSize: 15.0), textAlign: TextAlign.start),
                 SizedBox(
                      height: 20,
                 ),
                 TextFormField(
                   controller: idController,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0)
                     )
                   )
                 ),
                  SizedBox(
                      height: 20,
                  ),
                 TextFormField(
                   controller: nameController,
                   decoration: InputDecoration(
                     hintText: 'Ingresa tu nombre',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0)
                     )
                   ),
                   validator: (value){
                     if(value.length<4){
                       return "Nombre debe ser mayor que 3 caracteres";
                     }
                   },
                 ),
                  SizedBox(
                      height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Ingresa tu correo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      )
                    ),
                    validator: (value){
                      if(!value.contains('@')) return "Email invalido";
                    },
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 10.0,
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)
                      ),
                      child: Text('Actualizar',
                        style: TextStyle(
                          color: Colors.white, fontSize: 15.0
                        ),
                      ),
                      color: Colors.blueAccent,
                      onPressed: (){
                        if(formkey.currentState.validate())
                        setState(() {
                          _futureActualizarUsuario=actualizarUsuario(idController.text, nameController.text, emailController.text);
                        });
                      }
                    )
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            elevation: 10.0,
                            padding: EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0)
                              ),
                            color: Colors.redAccent,
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }
                          )
                        )
               ],
             ),           
           ):FutureBuilder<Usuario>(
                  future: _futureActualizarUsuario,
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
                              Text('Actualizando...', style: TextStyle(fontSize: 15.0),),
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