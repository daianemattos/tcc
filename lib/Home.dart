import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_app/PerfilPet.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPadrao(),
        drawer: DrawerPadrao(),
        body: SingleChildScrollView(
            child: Container(
                child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(32),
                                child: Image.asset("images/perfil_tutor.png")
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Mary Doe",
                                    style:
                                        TextStyle(fontSize: 22, color: Color(0xff777777)),
                                  ),
                                ),
                                Text(
                                  "(42) 99999-9999",
                                  style: TextStyle(fontSize: 15, color: Color(0xff777777)),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                              child: Text(
                                "MEUS PETS",
                                style: TextStyle(fontSize: 30, color: Color(0xff777777)),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_circle),
                                    color: Color(0xff478ca0)
                                )
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage("images/bolt.png"),
                              ),
                              title: Text("Bolt"),
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage("images/floki.png"),
                              ),
                              title: Text("Floki"),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => PerfilPet())
                                );
                              },
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage("images/jorge.png"),
                                ),
                                title: Text("Jorge")
                            )
                        ),
                      ],
                    )
                )
            )
        )
    );
  }
}
