import 'package:flutter/material.dart';

class Galeria extends StatefulWidget {
  const Galeria({Key key}) : super(key: key);

  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff478ca0),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
          ],
        )
    );
  }
}
