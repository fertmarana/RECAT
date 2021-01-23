import 'package:flutter/material.dart';
import 'dart:convert';

class minhaConta_morador extends StatelessWidget {
  final String morador;
  minhaConta_morador({Key key, this.morador}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 800.0,
            width: 800,
            child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Wrap(

                    runSpacing: 2.0,
                    children: [
                      Container(
                        alignment: Alignment.center,

                        padding: const EdgeInsets.all(10.0),
                        //decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                          'imagens/foto_pessoa.jpg',
                          fit: BoxFit.cover,
                          height: 200, // set your height
                          width: 200,// and width here
                        ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10,10),
                          decoration: BoxDecoration(
                            //color: Color(0xffb714365),
                            color: Colors.white,

                            border: Border.all(
                              color: Colors.black,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:Text('Carolina Silva' ,
                            textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 30.0, color: Colors.black),)
                      ),


                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(color: Colors.white,

                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                          ),
                          width: 500.0,
                          height: 80.0,
                          child:  ListView(
                                children: const <Widget>[

                                  ListTile(
                                  title: Text('Meus Endereços',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black)),
                                  ),


                                ]
                            )
                      )
                    ]
                )
            )
        )
    );
  }

}