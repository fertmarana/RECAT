import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recat/ColetaAgendada.dart';

class AgendamentoLista extends StatelessWidget {
  final Coletas agenda;
  AgendamentoLista({Key key, this.agenda}) : super(key: key);

  var controller = PageController(
    viewportFraction: 1 / 2,
    initialPage: 0,

  );

  @override
  Widget build(BuildContext context) {

    return new Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: 10.0),
    height: 200.0,
    width: 800,
    child: PageView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: agenda == null ? 0 : agenda.coletando.length, // Can be null
        itemBuilder: (BuildContext context, int index) {
          return new Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Color(0xffb714365),

                border: Border.all(
                  color: Color(0xffb714365),
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Text(agenda.coletando[index].enderecoColeta,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),)
              )
          );

        }
          //onTap: () {
          // Navigator.push(
          //   context,
          //  MaterialPageRoute(builder: (context) => Sugestions())
          //);
          //},
    )
        );
  }
}