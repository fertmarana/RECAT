import 'package:flutter/material.dart';
import 'package:recat/drawer_CentralPage.dart';
import 'package:recat/ColetaAgendada.dart';
import 'package:recat/display_agendamentos.dart';
import 'package:recat/PageView_dicas.dart';
import 'package:recat/AgendarColeta_Pag1.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';



class CentralPage extends StatefulWidget {
_CentralPage createState() => _CentralPage();
}

class _CentralPage extends State<CentralPage>{

var controller = PageController(
  viewportFraction: 1 ,
  initialPage: 0,
);
//CentralPage({Key key}) : super(key: key);

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Coletas parseJosn(String response) {
    if(response==null){
      return null;
    }
    Map<String, dynamic> jsonMap = json.decode(response);

    Coletas temp = Coletas.fromJson(jsonMap);
    return temp;

  }
/*
final agendarButon = Material(

  borderRadius: BorderRadius.circular(30.0),


  color: Color(0xFF009E74),
  child: MaterialButton(

    minWidth: 200.0,
    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CentralPage()),
        );
    },
    child: Text("Agendar Coleta",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0,color: Colors.white, fontWeight: FontWeight.bold)),
  ),
);

 */
final drawer = Drawer(
  child: ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.notifications_active),
        title: Text("Notificações"),
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
         // print("On Tap is fired");
        },
      ),
      ListTile(
        leading: Icon(Icons.lock),
        title: Text("Privacidade"),
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
          // print("On Tap is fired");
        },
      ),
      ListTile(
        leading: Icon(Icons.info),
        title: Text("Sobre"),
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
          // print("On Tap is fired");
        },
      ),
      ListTile(
        leading: Icon(Icons.help_center ),
        title: Text("Ajuda"),
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
          // print("On Tap is fired");
        },
      ),
      ListTile(
        leading: Icon(Icons.sensor_door),

        title: Text("Sair"),
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
          // print("On Tap is fired");
        },
      ),
    ],
  ),
);



@override
Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,
    endDrawer: drawer,
    appBar: AppBar(

      title: const Text('',
          style: TextStyle(color: Color(0xff16613D), fontWeight: FontWeight.bold)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.settings, color: Color(0xff16613D)),
          onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          // onPressed: () {
          // Navigator.push(
          // context,
          // MaterialPageRoute(builder: (context) => editperfil()),
          //);},
        ),
      ],
    ),

    body:  Container(
      child: Align(
      alignment: Alignment.topCenter,
      child: Wrap(
        runSpacing: 6.0,
        direction: Axis.horizontal,
        children: [
          SizedBox(height: 10.0),
          PageView_dicas(),
          SizedBox(height: 20.0),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AgendarColeta_Pag1()),
                      );
                    },
                    child: Text("Agendar Coleta",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),

              )
          ),
          Container(
            alignment: Alignment(-0.5, 0.6),
            child: Text('Meus Agendamentos ',
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
                  future: //loadAgendamento(),
                  DefaultAssetBundle.of(context).loadString('assets/Agendamento.json'),
                  builder: (context, snapshot) {
                    print(snapshot);

                    var data = parseJosn(snapshot.data.toString());

                    return AgendamentoLista(agenda: data);
                  }),
            ),
          )
        ],
      ),

    ),
    ),
  );
}
}

