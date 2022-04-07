import 'package:flutter/material.dart';
import 'package:projeto_app/NovaRotina.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class Rotina extends StatefulWidget {
  const Rotina({Key key}) : super(key: key);

  @override
  _RotinaState createState() => _RotinaState();
}

class _RotinaState extends State<Rotina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPadrao(),
      drawer: DrawerPadrao(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Image.asset("images/alimentacaoo.png")
                        ),
                        Center(
                          child: Text("Alimentação"),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Image.asset("images/banho.png")
                        ),
                        Center(
                          child: Text("Banho e Tosa"),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Image.asset("images/medicamento.png")
                        ),
                        Text("Medicamento"),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      child: Text(
                        "ROTINA",
                        style: TextStyle(fontSize: 28, color: Color(0xff777777)),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => NovaRotina())
                              );
                            },
                            iconSize: 30,
                            icon: Icon(Icons.add_circle),
                            color: Color(0xff478ca0)
                        )
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/alimentacaoo.png"),
                  ),
                  title: Text("Alimentação - Diária"),
                  subtitle: Text("Ração - 08:00h"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/alimentacaoo.png"),
                  ),
                  title: Text("Alimentação - Diária"),
                  subtitle: Text("Arroz e Frango - 12:00h"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/alimentacaoo.png"),
                  ),
                  title: Text("Alimentação - Diária"),
                  subtitle: Text("Ração - 16:00h"),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("images/alimentacaoo.png"),
                  ),
                  title: Text("Alimentação - Diária"),
                  subtitle: Text("Arroz e Frango - 20:00h"),
                ),
              ],
            )
          )
        )
      )
    );
  }
}
