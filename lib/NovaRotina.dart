import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NovaRotina extends StatefulWidget {
  const NovaRotina({Key key}) : super(key: key);

  @override
  _RotinaState createState() => _RotinaState();
}

class _RotinaState extends State<NovaRotina> {

  TextEditingController _controllerDescricao = TextEditingController();
  TextEditingController _controllerDataInicial = TextEditingController();
  TextEditingController _controllerDataFinal = TextEditingController();
  TextEditingController _controllerHora = TextEditingController();

  String _dropdownTipoRotina = 'Alimentação';
  String _dropdownPeriodicidade = 'Diária';
  String _tipoRotina = '';
  String _periodicidade = '';
  bool _escolhaUsuarioNotificacao = false;

  @override
  void initState() {
    super.initState();

    _controllerDescricao.addListener(() => setState(() {}));
  }

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
            padding: EdgeInsets.all(20),
            child: Center(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:
                        Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _dropdownTipoRotina,
                                borderRadius: BorderRadius.circular(10),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _dropdownTipoRotina = newValue;
                                    _tipoRotina = newValue;
                                  });
                                },
                                items: <String>['Alimentação', 'Banho e Tosa', 'Medicação']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _dropdownPeriodicidade,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _dropdownPeriodicidade = newValue;
                                    _periodicidade = newValue;
                                  });
                                },
                                items: <String>['Diária', 'Semanal', 'Mensal', 'Anual']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: TextField(
                        controller: _controllerDescricao,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Descrição",
                            suffixIcon: _controllerDescricao.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    _controllerDescricao.text = '';
                                  });
                                }
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: TextField(
                        controller: _controllerDataInicial,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Data Inicial",
                            suffixIcon: _controllerDataInicial.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    _controllerDataInicial.text = '';
                                  });
                                }
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onTap: () async {
                          final DateTime date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2150)
                          );
                          if (date != null) {
                            setState(() {
                              _controllerDataInicial.text = DateFormat('d/MM/yyyy').format(date);
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: TextField(
                        controller: _controllerDataFinal,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Data Final",
                            suffixIcon: _controllerDataFinal.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    _controllerDataFinal.text = '';
                                  });
                                }
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onTap: () async {
                          final DateTime date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2150)
                          );
                          if (date != null) {
                            setState(() {
                              _controllerDataFinal.text = DateFormat('d/MM/yyyy').format(date);
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: TextField(
                        controller: _controllerHora,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                            hintText: "Hora",
                            suffixIcon: _controllerHora.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    _controllerHora.text = '';
                                  });
                                }
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onTap: () async {
                          final initialTime = TimeOfDay(hour: 0, minute: 0);
                          final time = await showTimePicker(
                              context: context,
                              initialTime: initialTime
                          );
                          if (time != null) {
                            setState(() {
                              final hour = time.hour.toString().padLeft(2, '0');
                              final minute = time.minute.toString().padLeft(2, '0');
                              _controllerHora.text = '${hour}:${minute}h';
                            });
                          }
                        },
                      ),
                    ),
                    SwitchListTile(
                          title: Text("Receber notificações"),
                          value: _escolhaUsuarioNotificacao,
                          onChanged: (bool valor){
                            setState(() {
                              _escolhaUsuarioNotificacao = valor;
                            });
                          },
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            height: 50.0,
                            child: ElevatedButton(
                                onPressed: (){},
                                child: Text(
                                    "SALVAR"
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff478ca0)),
                                )
                            )
                        )
                    )
                  ],
                )
            )
          )
        )
    );
  }
}