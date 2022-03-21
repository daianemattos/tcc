import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto_app/Cadastro.dart';
import 'package:projeto_app/Home.dart';
import 'package:projeto_app/model/Usuario.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos(){

    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if( email.isNotEmpty && email.contains("@") ){
        if( senha.isNotEmpty ){
          setState(() {
            _mensagemErro = "";
          });

          Usuario usuario = Usuario();
          usuario.email = email;
          usuario.senha = senha;

          _loginUsuario( usuario );

        }else{
          setState(() {
            _mensagemErro = "Senha inválida. Tente novamente.";
          });
        }
    }else{
        setState(() {
          _mensagemErro = "E-mail inválido. Tente novamente.";
        });
    }
  }

  _loginUsuario( Usuario usuario ) async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then(( FirebaseUser ){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home()
        )
      );

    }).catchError(( error ){

      setState(() {
        _mensagemErro = "Dados Inválidos. Tente novamente!";
      });

    });

  }

  Future _verificarUsuarioLogado() async{

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();

    User usuarioLogado = await auth.currentUser;
    if(usuarioLogado != null){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );
    }
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                      "images/logo.png",
                    width: 220.0,
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      //filled: true,
                      //fillColor: Color(0xffecebea),
                      hintText: "E-mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)
                      )
                    )
                  )
                ),
                TextField(
                    controller: _controllerSenha,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        //filled: true,
                        //fillColor: Color(0xffecebea),
                        hintText: "Senha",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)
                        )
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: SizedBox(
                        height: 60.0,
                        child: ElevatedButton(
                            onPressed: _validarCampos,
                            child: Text(
                              "Entrar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff478ca0)
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                    )
                                )
                            )
                        )
                    )
                ),
                Center(
                  child: GestureDetector(
                    child: Text("Esqueceu a senha?"),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          print("google");
                        },
                        icon: FaIcon(FontAwesomeIcons.google),
                        iconSize: 32,
                        color: Colors.indigo,
                      ),
                      IconButton(
                        onPressed: () {
                          print("facebook");
                        },
                        icon: FaIcon(FontAwesomeIcons.facebook),
                        iconSize: 32,
                        color: Colors.indigo,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 35,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                Center(
                  child: GestureDetector(
                    child: Text("Cadastrar-se"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cadastro()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    )
                  )
                )
              ],
            )
          ),
        )
      ),
    );
  }
}
