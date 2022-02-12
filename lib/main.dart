import 'package:flutter/material.dart';
import 'package:projeto_app/Home.dart';
import 'package:projeto_app/Login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async{
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('pt'),
    ],
    locale: const Locale('pt'),
    home: Login(),
    theme: ThemeData(
      primaryColor: Colors.white
    ),
    debugShowCheckedModeBanner: false,
  ));
}
