import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recat/ColetaAgendada.dart';
import 'dart:convert';
import 'package:recat/WriteAndReadFile.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:recat/sobreAgendamento.dart';


class writeJsonfile extends StatefulWidget {

  writeJsonfile({Key key}) : super(key: key);

  @override
  _writeJsonfile createState() => _writeJsonfile();
}

class _writeJsonfile extends State<writeJsonfile> {
  Coletas agenda;
  String val;
  Future<Directory> _appDocDir;
  WriteandReadfile warF;
  Coletas agendadeFile;
  String currentText = "oi";
  Map<String, dynamic> exemplo = {
    "id": "00000000",
    "moradorNome": "Suzanna",
    "enderecoColeta": "Avenida Getúlio Vargas 2-18",
    "cooperativa": "Cooperativa Recicla",
    "diaColeta": "11/02/2021",
    "horaColeta": "14:00",
    "tipoLixo": ["Plástico, Papel, Eletrônico"],
    "statusPedido": "aprovado",
    "statusColeta": "agendada"
  };

  TextEditingController emailController = new TextEditingController();

  void getAppDirectory() {
    setState(() {
      _appDocDir = Platform.isAndroid
          ? getExternalStorageDirectory()
          : getApplicationSupportDirectory();
    });
  }


  initState() {
    warF = new WriteandReadfile(filename: "/AgendamentosTest.json");
   getAppDirectory();
  }

  String transformintoString(Coletas test) {

    var thistext = jsonEncode(test.toJson());
    print('AQUIIIII');
    print(thistext);
    // Write the file.
    return thistext;
  }

  Coletas parseJosn(String response) {
    if(response==null){
      return null;
    }
    Map<String, dynamic> jsonMap = json.decode(response);

    Coletas temp = Coletas.fromJson(jsonMap);
    return temp;

  }

  _getFile() async {
    final result = await warF.readCounter().then((String result) {
      setState(() {
        val = result;
      });
    });
  }

    @override
    Widget build(BuildContext context) {
      return Wrap(
          runSpacing: 6.0,
          direction: Axis.horizontal,
          children: [
            TextField(
                controller: emailController,
                obscureText: true,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'PLEASE ENTER YOUR EMAIL',
                  hintStyle: TextStyle(color: Colors.grey),
                )
            ),
            Container(
              child: new Center(
                // Use future builder and DefaultAssetBundle to load the local JSON file
                child: new FutureBuilder(
                    future: //loadAgendamento(),
                    DefaultAssetBundle.of(context).loadString(
                        'assets/Agendamento.json'),
                    builder: (context, snapshot) {
                      agenda = parseJosn(snapshot.data.toString());
                      agenda.coletando.add(ColetaAgendada.fromJson(exemplo));
                      String jsonToSave = transformintoString(agenda);
                      warF.writeString(jsonToSave);

                      return Container();
                    }),
              ),
            ),
            Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Material(

                    borderRadius: BorderRadius.circular(30.0),


                    color: Color(0xFF009E74),
                    child: MaterialButton(

                      minWidth: 200.0,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        currentText = emailController.text;
                        print(currentText);
                      },
                      child: Text("Agendar Coleta",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),

                )
            ),
            Container(
              alignment: Alignment(-0.5, 0.6),
              child: Text(currentText,
                style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xff16613D)
                ),
              ),
            ),
            Container(
              child: new Center(
                // Use future builder and DefaultAssetBundle to load the local JSON file
                child: new FutureBuilder(
                    future: _appDocDir,
                    builder: (context, snapshot) {
                      //print(snapshot);
                      //String Val = warF.readCounter().toString();
                      // agendadeFile = parseJosn(Val.toString());
                      // print(agendadeFile.coletando[agendadeFile.coletando.length-1].id);

                      Text text = Text('', style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold));
                      print('AQUIIIIIIIIII LOOLLOLO');
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          text = Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          text = Text('Path: ${snapshot.data.path}');
                          _getFile();
                          //print( agendadeFile.coletando[agendadeFile.coletando.length -1].id);
                        } else {
                          text = Text('Unavailable');
                        }
                      }

                      //Map<String, dynamic> jsonMap = jsonDecode(val);
                      //agendadeFile = parseJosn(Val);

                      return new Container(
                        child: text,
                      );
                      return Container();
                    }),
              ),
            ),
          ]
      );
    }

}