import 'package:flutter/material.dart';
import 'package:practicando_app/data/data.dart';
import 'package:practicando_app/model/speciality.dart';
import 'package:practicando_app/screens/info.dart';


String selectedCategorie= "Adultos";
class MainInfo extends StatefulWidget{
  _MainInfo createState()=>_MainInfo();
}

class _MainInfo extends State<MainInfo>{
  List<String> categorias= ['Adultos', 'Niños', 'Mujeres', 'Hombres', 'Ancianos'];
  List<SpecialityModel> especialidades;

  @override
  void initState() { 
    super.initState();
    especialidades= getSpeciality();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black87
        ),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text("Realiza tu \nConsulta",
                 style: TextStyle(
                   color: Colors.black87.withOpacity(0.8),
                   fontSize: 30,
                   fontWeight: FontWeight.w600
                 ), 
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height:50,
                decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(width:10),
                    Text("Buscar", style: TextStyle(
                      color: Colors.grey,
                      fontSize: 19
                    ),)
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Categorias', style: TextStyle(
                color: Colors.black87.withOpacity(0.8),
                fontSize: 25,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 20,),
              Container(
                height: 30,
                child: ListView.builder(
                  itemCount: categorias.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,                  
                  itemBuilder: (context, index){
                    print(index);
                    return CategorieTile(
                      categorie: categorias[index],
                      isSelected: selectedCategorie==categorias[index],
                      context:this
                    );
                  }
                  )
              ),
              SizedBox(height: 20,),
              Container(
                height:250,
                child: ListView.builder(
                  itemCount: especialidades.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,                  
                  itemBuilder: (context,index){
                    print(especialidades);
                    return SpecialistTile(
                      imgAssetPath: especialidades[index].imgAssetPath,
                      speciality: especialidades[index].speciality,
                      noOfDoctors: especialidades[index].noOfDoctors,
                      backColor: especialidades[index].backgroundColor
                    );
                  }
                )
              ),
              SizedBox(height: 20,),
              Text("Doctores", style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 20,),
              DoctorsTile()
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieTile extends StatefulWidget{
  String categorie;
  bool isSelected;
  _MainInfo context;
  CategorieTile({this.categorie, this.isSelected, this.context});
  @override
  _CategorieTileState createState()=>_CategorieTileState();
}
class _CategorieTileState extends State<CategorieTile>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.context.setState((){
          selectedCategorie=widget.categorie;
          print(selectedCategorie);
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left:8),
        height:30,
        decoration: BoxDecoration(
          color:widget.isSelected?Color(0xffFFD0AA):Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text(widget.categorie, style:TextStyle(
          color: widget.isSelected?  Color(0xffFC9535) : Color(0xffA1A1A1)
        ))
      ),
    );
  }
}

class SpecialistTile extends StatelessWidget{
  String imgAssetPath;
  String speciality;
  int noOfDoctors;
  Color backColor;
  SpecialistTile({@required this.imgAssetPath, @required this.speciality,
  @required this.noOfDoctors, @required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(24)
      ),
      padding: EdgeInsets.only(top:16,right: 16, left:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(speciality, style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),),
          SizedBox(height: 6,),
          Text("$noOfDoctors Doctores",style: TextStyle(
            color: Colors.white,
            fontSize: 13
          ),),
          Image.asset(imgAssetPath,height:60, fit: BoxFit.fitHeight,)
        ],
      )
    );
  }
}

class DoctorsTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Info()
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFEEE0),
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.symmetric(horizontal: 24,
        vertical: 18),
        child: Row(
          children: <Widget>[
            Image.asset("assets/doctor_pic.png", height: 60,),
            SizedBox(width: 17,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dr. Priscila Pajuelo", style: TextStyle(
                  color: Color(0xffFC9535),
                  fontSize: 19
                ),),
                SizedBox(height: 2,),
                Text("Especialista", style: TextStyle(
                  fontSize: 15
                ),)
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical:9),
              decoration: BoxDecoration(
                color: Color(0xffFBB97C),
                borderRadius: BorderRadius.circular(13)
              ),
              child: Text("Llamar", style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500
              ),),
            )
          ],          
        ),
      ),
    );
  }
}