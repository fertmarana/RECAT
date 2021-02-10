import 'package:flutter/material.dart';
import 'package:recat/ColetaAgendada.dart';
import 'dart:convert';
import 'package:recat/app_usuario_catadores/display_agendamentosCard_Swipe_catadores.dart';
import 'package:recat/CatadorouMorador.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:flutter_tindercard/flutter_tindercard.dart';


class agendamentosDia_catadores extends StatefulWidget {


  _agendamentosDia_catadores createState() => _agendamentosDia_catadores();
}

class _agendamentosDia_catadores extends State<agendamentosDia_catadores> {


  var controller = PageController(
    viewportFraction: 1,
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

  final agendarButon = Material(

    borderRadius: BorderRadius.circular(30.0),


    color: Color(0xFF009E74),
    child: MaterialButton(

      minWidth: 200.0,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {},
      child: Text("Agendar Coleta",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold)),
    ),
  );
  final drawer = Drawer(
    child: ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.notifications_active),
          title: Text("Notificações"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // print("On Tap is fired");
          },
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text("Privacidade"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // print("On Tap is fired");
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text("Sobre"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // print("On Tap is fired");
          },
        ),
        ListTile(
          leading: Icon(Icons.help_center),
          title: Text("Ajuda"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // print("On Tap is fired");
          },
        ),
        ListTile(
          leading: Icon(Icons.sensor_door),

          title: Text("Sair"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            builder: (_) => CatadorOuMorador();

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
            style: TextStyle(
                color: Color(0xff16613D), fontWeight: FontWeight.bold)
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
            child: Container(
              child: new Center(
                // Use future builder and DefaultAssetBundle to load the local JSON file
                child: new FutureBuilder(
                    future: //loadAgendamento(),
                    DefaultAssetBundle.of(context).loadString('assets/AgendamentosdoDia.json'),
                    builder: (context, snapshot) {
                      print(snapshot);

                      var data = parseJosn(snapshot.data.toString());
                      print(data);
                      //;
                      return data == null? Container(child: Text('oi'),):
                      //Container(child: Text('aqui'),);
                      Container(
                          width: 600,
                          height: 800,
                          child: display_CardSwipe(ascoletas: data)
                      );
                    }),
              ),
            )

        ),

      ),

    );
  }
}

/*
class StackOfCards extends StatelessWidget {
  final int num;
  final Widget child;
  final double offset;

  const StackOfCards({Key key, int num = 1, @required this.child, this.offset = 10.0})
      : this.num = num > 0 ? num : 1,
        assert(offset != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        Positioned(
            top: 30,
            child: Draggable(
              feedback:,
              child: Card(),
            )
        )
    );
  }
  /*Widget build(BuildContext context) => Stack(
    children: List<Widget>.generate(
        num - 1,
            (val) => Positioned(
            bottom: val * offset,
            left: val * offset,
            top: (num - val - 1) * offset,
            right: (num - val - 1) * offset,
            child: Card(child: Container(
                width: 100,
                height: 200.0)))).toList()
      ..add(
        Padding(
          child: Card(child: child),
          padding: EdgeInsets.only(bottom: (num - 1) * offset, left: (num - 1) * offset),
        ),
      ),
  );

   */
}
*/
