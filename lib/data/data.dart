

import 'package:flutter/material.dart';
import 'package:practicando_app/model/speciality.dart';

List<SpecialityModel> getSpeciality(){
  List<SpecialityModel> specialities= new List<SpecialityModel>();
  SpecialityModel specialityModel= new SpecialityModel();

  //1
  specialityModel.noOfDoctors=10;
  specialityModel.speciality="Tos y Frio";
  specialityModel.imgAssetPath="assets/img1.png";
  specialityModel.backgroundColor= Color(0xffFBB97C);
  specialities.add(specialityModel);

  //2
  specialityModel = new SpecialityModel();
  specialityModel.noOfDoctors = 17;
  specialityModel.speciality = "Diabetes";
  specialityModel.imgAssetPath = "assets/img2.png";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  //3
  specialityModel = new SpecialityModel();
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Diabetes Care";
  specialityModel.imgAssetPath = "assets/img3.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);
  
  return specialities;
}