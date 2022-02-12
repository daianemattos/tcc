import 'package:flutter/material.dart';
import 'package:projeto_app/Calendario.dart';
import 'package:projeto_app/Galeria.dart';

class PerfilPet extends StatefulWidget {
  const PerfilPet({Key key}) : super(key: key);

  @override
  _PerfilPetState createState() => _PerfilPetState();
}

class _PerfilPetState extends State<PerfilPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff478ca0),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
      ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(20),
                          child: Image.asset("images/perfil_pet.png")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Floki",
                              style:
                              TextStyle(fontSize: 22, color: Color(0xff777777)),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "1 ano",
                              style: TextStyle(fontSize: 15, color: Color(0xff777777)),
                            ),
                          ),
                          Text(
                            "SRD",
                            style: TextStyle(fontSize: 15, color: Color(0xff777777)),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> Galeria())
                                  );
                                },
                                child: Image.asset("images/galeria.png")
                            ),
                          ),
                          Text("Galeria")
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: Image.asset("images/rotina.png"),
                          ),
                          Text("Rotina")
                        ],
                      )

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> Calendario())
                                  );
                                },
                                child: Image.asset("images/calendario.png")
                            ),
                          ),
                          Text("Calendário")
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: Image.asset("images/historico.png"),
                          ),
                          Text("Histórico Médico")
                        ],
                      )
                    ],
                  )
                ],
              )
            )
          )
        )
    );
  }
}
