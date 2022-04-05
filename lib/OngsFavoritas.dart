import 'package:flutter/material.dart';

import 'Padrao/PdAppBar.dart';
import 'Padrao/PdDrawer.dart';

class OngsFavoritas extends StatefulWidget {
  const OngsFavoritas({Key key}) : super(key: key);

  @override
  State<OngsFavoritas> createState() => _OngsFavoritasState();
}

class _OngsFavoritasState extends State<OngsFavoritas> {
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

                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("ONG - SOS AMIGO BICHO"),
                            subtitle: Text("(42)99999-9999"),

                            onTap: () {

                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 200,
                                    color: Colors.amber,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Text('Modal BottomSheet'),
                                          ElevatedButton(
                                            child: const Text('Close BottomSheet'),
                                            onPressed: () => Navigator.pop(context),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          ),

                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("Canil da Jocelina"),
                            subtitle: Text("(42)99999-9999"),
                          ),

                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("ONG - Amigos Leais"),
                            subtitle: Text("(42)99999-9999"),
                          ),

                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("ONG - São Francisco"),
                            subtitle: Text("(42)99999-9999"),
                        ),

                      ],
                  )
                )
            )
        )
    );
  }
}
