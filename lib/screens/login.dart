import 'package:flutter/material.dart';
import 'package:practicando_app/screens/app_tabs.dart';

class Login extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
            color: Colors.black87
        ),
        ),
        drawer: Drawer(
          child: Container()// Populate the Drawer in the next step.
      ),  
      backgroundColor: Colors.lightBlueAccent,    
      body: Form(        
        child:Container(
              padding: EdgeInsets.all(55.0), 
              margin: EdgeInsets.all(30.0),
              height: 500,  
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
               boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: Colors.white
                  ),                  
                ]
              ),           
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,           
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[ 
              Center(
                child: Text("Bienvenido", style: TextStyle(fontSize: 30.0),)
              ),  
              SizedBox(
                height: 40,
              ),        
            TextFormField(
              decoration:  InputDecoration(
                hintText: 'Enter your email',
                border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          borderSide: new BorderSide(
                          ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration:  InputDecoration(
                hintText: 'Enter your password',
                border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          borderSide: new BorderSide(
                          ),
                ),
              ),
            ),
             SizedBox(height: 30),             
            SizedBox(
              width: double.infinity,            
              child:RaisedButton(                
                elevation: 10.0,
                padding:EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blueAccent)
                ),
                color: Colors.blueAccent,
                child: Text("Entrar", style: TextStyle(color:Colors.white, fontSize: 15.0),), onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context)=>AppTabs()
                    )
                  );
                })
                )
          ]))
            ),
    );
  }
}
