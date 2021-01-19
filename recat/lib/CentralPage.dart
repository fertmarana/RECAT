import 'package:flutter/material.dart';
import 'package:recat/InsidedContent.dart';
import 'main.dart';

class CentralPage extends StatelessWidget {
var controller = PageController(
  viewportFraction: 1 / 2,
  initialPage: 0,
);
CentralPage({Key key}) : super(key: key);

final agendarButon = Material(

  elevation: 10.0,
  borderRadius: BorderRadius.circular(30.0),

  color: Color(0xFF009E74),
  child: MaterialButton(

    minWidth: 200.0,
    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    onPressed: () {},
    child: Text("Agendar Coleta",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0,color: Colors.white, fontWeight: FontWeight.bold)),
  ),
);




@override
Widget build(BuildContext context) {
  return Scaffold(
    body:  Container(
      child: Align(
      alignment: Alignment.bottomCenter,
      child: Wrap(
        runSpacing: 8.0,
        direction: Axis.horizontal,
        children: [
          SizedBox(height: 55.0),
        Container(
          child: Align(
        alignment: Alignment.center,
        child: agendarButon,

        )
        ),
          Container(
            alignment: Alignment(-0.9, 0.6),
            child: Text('Ajuda',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff16613D)
              ),
            ),
          ),


      Container(
        //alignment: Alignment.topRight,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 100.0,
        width: 500,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            InkWell(
              child: Container(
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
                      child: Text('Como separar o lixo',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0,color: Colors.white),)
                  )
              ),
              //onTap: () {
              // Navigator.push(
              //   context,
              //  MaterialPageRoute(builder: (context) => Sugestions())
              //);
              //},
            ),

            Container(
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

                    child: Text('Onde separar o lixo',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0,color: Colors.white),)
                )
            ),

            Container(
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

                    child: Text('',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0,color: Colors.white),)
                )


            ),
            Container(
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

                    child: Text('Zamioculca',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0,color: Colors.white),)
                )


            ),


            Container(
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

                    child: Text('Girassol',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0,color: Colors.white),)
                )


            ),

            Container(
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

                    child: Text('Anturio',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0,color: Colors.white),)
                )


            ),

          ],
        ),
      ),
          Container(
            alignment: Alignment(-0.9, 0.6),
            child: Text('Meus Agendamentos ',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff16613D)
              ),
            ),
          ),
          Container(
            //alignment: Alignment.topRight,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            width: 700,
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                InkWell(
                  child: Container(
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
                          child: Text('Como separar o lixo',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0,color: Colors.white),)
                      )
                  ),
                  //onTap: () {
                  // Navigator.push(
                  //   context,
                  //  MaterialPageRoute(builder: (context) => Sugestions())
                  //);
                  //},
                ),

                Container(
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

                        child: Text('Onde separar o lixo',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0,color: Colors.white),)
                    )
                ),

                Container(
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

                        child: Text('',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0,color: Colors.white),)
                    )


                ),
                Container(
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

                        child: Text('Zamioculca',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0,color: Colors.white),)
                    )


                ),


                Container(
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

                        child: Text('Girassol',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0,color: Colors.white),)
                    )


                ),

                Container(
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

                        child: Text('Anturio',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0,color: Colors.white),)
                    )


                ),

              ],
            ),
          )


        ],
      ),

    ),
    ),
  );
}
}

