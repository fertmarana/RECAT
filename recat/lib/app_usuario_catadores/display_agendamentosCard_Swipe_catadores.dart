import 'package:flutter/material.dart';
import 'package:recat/ColetaAgendada.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

class display_CardSwipe extends StatefulWidget {
  final Coletas ascoletas ;
  display_CardSwipe({Key key, this.ascoletas}) : super(key: key);
  _display_CardSwipe createState() => _display_CardSwipe();
}

class _display_CardSwipe extends State<display_CardSwipe> {
  int len;
  List<Widget> cardList;
  Coletas ascoletas_carregadas ;
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
      len = len - 1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    ascoletas_carregadas = widget.ascoletas;
    len = widget.ascoletas.coletando.length;
   // print(agenda_coletas);


    super.initState();
  }




  Widget build(BuildContext context) {
    CardController controller;

    return Scaffold(
      body: Container(
       child: Align(
        alignment: Alignment.topCenter,
        child: new TinderSwapCard(
         orientation: AmassOrientation.BOTTOM,
         totalNum: ascoletas_carregadas.coletando.length,
         stackNum: 3,
         swipeEdge: 4.0,
         maxWidth: MediaQuery.of(context).size.width * 0.9,
         maxHeight: MediaQuery.of(context).size.width * 0.9,
         minWidth: MediaQuery.of(context).size.width * 0.8,
         minHeight: MediaQuery.of(context).size.width * 0.8,
         cardBuilder: (context, index) {
           print('index ${index}');
           return Card(
             child: Container(
               color: Colors.white,

               child: Card(
                 elevation: 12,
                 color: Colors.white,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 child: Container( width: 300, height: 400,
                   child:  Wrap(
                     children: [
                       Align(
                           alignment: Alignment.topRight,
                           child: Column(
                               crossAxisAlignment: CrossAxisAlignment.stretch,
                               children: [
                                 Container(
                                     width: 100.0,
                                     height: 50.0,
                                     decoration: BoxDecoration(
                                       color: Colors.blue,
                                       border: Border.all(color: Colors.white, width: 8,),
                                       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                     ),

                                     child:  Text('Coleta ' + ascoletas_carregadas.coletando[index].statusColeta,
                                       textAlign: TextAlign.center,
                                       style: TextStyle(fontSize: 20.0, color: Colors.white),)
                                 )
                               ]
                           )
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             //decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
                             child: Image.asset('imagens/icone_localizacao.png',
                               fit: BoxFit.cover,
                               height: 50, // set your height
                               width: 70, // and width here
                             ),
                           ),
                           Text('Endereço: \n' + ascoletas_carregadas.coletando[index].enderecoColeta,
                             textAlign: TextAlign.start,
                             style: TextStyle(fontSize: 17.0, color: Colors.black),)
                         ],
                       ),
                       Container(
                           width: 500.0,
                           height: 30.0,
                           child:   Text('  Dia da Coleta: ' + ascoletas_carregadas.coletando[index].diaColeta,
                             textAlign: TextAlign.left,
                             style: TextStyle(fontSize: 20.0, color: Colors.black),)
                       ),
                       Container(
                           width: 500.0,
                           height: 60.0,
                           child:   Text('  Cooperativa: ' + ascoletas_carregadas.coletando[index].cooperativa,
                             textAlign: TextAlign.left,
                             style: TextStyle(fontSize: 20.0, color: Colors.black),)
                       ),


                     ],
                   ),
                 ),
               )
             )

           );
         },
         cardController: controller = CardController(),
         swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
           /// Get swiping card's alignment
           if (align.x < 0) {
             //print("Card is LEFT swiping");
           } else if (align.x > 0) {
             //print("Card is RIGHT swiping");
           }
         },
         swipeCompleteCallback:
             (CardSwipeOrientation orientation, int index) {
           print(orientation.toString());
           if (orientation == CardSwipeOrientation.LEFT) {
             print("Card is LEFT swiping");
             print(ascoletas_carregadas.coletando.length);
           } else if (orientation == CardSwipeOrientation.RIGHT) {
             print("Card is RIGHT swiping");
             print(ascoletas_carregadas.coletando.length);
           }
         },
       ),
      )
      )
    );
  }




}

