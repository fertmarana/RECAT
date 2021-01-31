import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recat/ColetaAgendada.dart';
import 'dart:convert';
import 'package:recat/WriteAndReadFile.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:recat/database.dart';
import 'package:recat/sobreAgendamento.dart';





class TestWrite extends StatefulWidget {
  @override
  _TestWrite createState() => new _TestWrite();
}

class _TestWrite extends State<TestWrite> {

  Map<String, dynamic> response = {
    "agendamentos":
    [
      {
        "id": "9239292",
        "moradorNome": "Suzanna",
        "enderecoColeta": "Avenida Getúlio Vargas 2-18",
        "cooperativa": "Cooperativa Recicla",
        "diaColeta": "11/02/2021",
        "horaColeta": "14:00",
        "tipoLixo": ["Plástico, Papel, Eletrônico"],
        "statusPedido": "aprovado",
        "statusColeta": "agendada"
      },
      {
        "id": "9000000",
        "moradorNome": "ANAAAA",
        "enderecoColeta": "Avenida Getúlio Vargas 2-18",
        "cooperativa": "Cooperativa Recicla",
        "diaColeta": "11/02/2021",
        "horaColeta": "14:00",
        "tipoLixo": ["Plástico, Papel, Eletrônico"],
        "statusPedido": "aprovado",
        "statusColeta": "feita"
      },
      {
        "id": "9000000",
        "moradorNome": "ANAAAA",
        "enderecoColeta": "Rua Doze",
        "cooperativa": "Cooperativa Recicla",
        "diaColeta": "11/02/2021",
        "horaColeta": "14:00",
        "tipoLixo": ["Plástico, Papel, Eletrônico"],
        "statusPedido": "aprovado",
        "statusColeta": "cancelada"
      }
    ]

  };

  TextEditingController keyInputController = new TextEditingController();
  TextEditingController valueInputController = new TextEditingController();

  File jsonFile;
  Directory dir;
  String fileName = "myFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }

  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, dynamic value) {
    print("Writing to file!");
    Map<String, dynamic> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("JSON Tutorial"),),
      body: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("File content: ", style: new TextStyle(fontWeight: FontWeight.bold),),
          new Text(fileContent.toString()),
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("Add to JSON file: "),
          new TextField(
            controller: keyInputController,
          ),
          new TextField(
            controller: valueInputController,
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0)),
          new RaisedButton(
            child: new Text("Add key, value pair"),
            onPressed: () //=> writeToFile(keyInputController.text, valueInputController.text),
            {
              savePost(Coletas.fromJson(response));

            }
          )
        ],
      ),
    );
  }
}