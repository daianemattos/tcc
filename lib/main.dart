import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_app/Home.dart';
import 'package:projeto_app/Login.dart';

void main() async{
  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Colors.white
    ),
    debugShowCheckedModeBanner: false,
  ));
}
