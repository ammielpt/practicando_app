import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _Info createState() => _Info();
}

class _Info extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/doctor_pic2.png',
                      height: 220,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      height: 220,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Dr.Priscila Pajuelo",
                            style: TextStyle(fontSize: 32),
                          ),
                          Text(
                            "Cirugia General",
                            style: TextStyle(fontSize: 19, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: <Widget>[
                              IconTile(
                                backColor: Color(0xffFFECDD),
                                imgAssetPath: "assets/email.png",
                              ),
                              IconTile(
                                backColor: Color(0xffFEF2F0),
                                imgAssetPath: "assets/call.png",
                              ),
                              IconTile(
                                backColor: Color(0xffEBECEF),
                                imgAssetPath: "assets/video_call.png",
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                height: 26,
              ),
              Text(
                "Sobre",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Dr. Priscila tiene mas de 20 de experiencia en el rubro de la medicina usted puede consultarle con total confianza sobre alguna dolencia o malestar.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset("assets/mappin.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Direccion",
                              style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: 20
                              ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width-268,
                                child: Text(
                                   "Av Santa Anita #4556",
                                    style: TextStyle(color: Colors.grey),
                                )
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/clock.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                 "Atenciones diarias",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width-268,
                                child: Text(
                                    'Lunes - Viernes Abierto hasta las 7 Pm',
                                    style: TextStyle(color: Colors.grey),
                                  )
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/map.png",
                    width:170
                  )
                ],
              ),
              Text(
                "Actividad",
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 24, horizontal:16),
                      decoration: BoxDecoration(
                        color: Color(0xffFBB97C),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xffFCCA9B),
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Image.asset("assets/list.png")
                          ),
                          SizedBox(
                            width:16
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2-130,
                            child: Text(
                              "Lista de horario",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical:28,horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color(0xffFCCA9B),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xffBBBBBB),
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Image.asset("assets/list.png"),
                          ),
                          SizedBox(
                            width: 16
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2-130,
                            child: Text(
                              "Dr Posts",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17
                              )
                            )
                          )
                        ],
                      ),
                    )
                  )
                ]
              )
            ],
          )
        )
       );
  }
}

class IconTile extends StatelessWidget {
  String imgAssetPath;
  Color backColor;
  IconTile({this.imgAssetPath, this.backColor});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 16),
        child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: backColor, borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              imgAssetPath,
              width: 20,
            )));
  }
}
