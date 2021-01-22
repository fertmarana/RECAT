import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recat/ColetaAgendada.dart';
import 'package:recat/display_agendamentos.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class teste_future extends StatefulWidget {
  @override
  _teste_future createState() => new _teste_future ();
}

class _teste_future  extends State<teste_future > {
  List data;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Load local JSON file",
            style: new TextStyle(color: Colors.white),),
        ),
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: //loadAgendamento(),
                DefaultAssetBundle.of(context).loadString('assets/Agendamento.json'),
                builder: (context, snapshot) {
                  print(snapshot);

                    var data = parseJosn(snapshot.data.toString());

                  return AgendamentoLista(agenda: data);
                }),
          ),
        ));
  }

  Coletas parseJosn(String response) {
    if(response==null){
      return null;
    }
    Map<String, dynamic> jsonMap = json.decode(response);

    Coletas temp = Coletas.fromJson(jsonMap);
  return temp;

  }
}