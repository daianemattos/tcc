import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_app/Login.dart';
import '../Calendario.dart';
import '../Galeria.dart';
import '../Home.dart';
import '../PerfilPet.dart';
import '../Rotina.dart';

class DrawerPadrao extends StatefulWidget {
  const DrawerPadrao({key}) : super(key: key);

  @override
  _DrawerPadraoState createState() => _DrawerPadraoState();
}

class _DrawerPadraoState extends State<DrawerPadrao> {

  deslogar () async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.signOut();
  }

  String get email => 'jonny@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,//Color(0xFFBBDEFB),
        child: ListView(
            padding:EdgeInsets.zero,
            children:[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff478ca0),
                ),
                accountName: Text('Jonny',
                  style: TextStyle(
                    color: Colors.white,
                  )
                ),
                accountEmail: Text(email,
                    style: TextStyle(
                      color: Colors.white,
                    )
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                        email[0].toUpperCase(),
                        style: TextStyle(
                            fontSize:50
                        )
                    )
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xffffbd59),
                ),
                title: Text(
                  "Início",
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home())
                  );
                },
              ),
              ListTile(
                  leading: Icon(
                    Icons.pets,
                    color: Color(0xffffbd59),
                  ),
                  title: Text(
                    "Perfil Pet",
                  ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PerfilPet())
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.date_range,
                  color: Color(0xffffbd59),
                ),
                title: Text(
                  "Calendário",
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calendario())
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_camera,
                  color: Color(0xffffbd59),
                ),
                title: Text(
                  "Galeria",
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Galeria())
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.assignment,
                  color: Color(0xffffbd59),
                ),
                title: Text(
                  "Rotina",
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Rotina())
                  );
                },
              ),ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Color(0xffffbd59),
                ),
                title: Text(
                  "Sair",
                ),
                onTap: () {
                  deslogar;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())
                  );
                },
              ),
            ]
        )
    );
  }
}