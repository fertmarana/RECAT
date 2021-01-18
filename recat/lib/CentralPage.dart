import 'package:flutter/material.dart';
import 'package:recat/InsidedContent.dart';
import 'main.dart';

class CentralPage extends StatelessWidget {
var controller = PageController(
  viewportFraction: 1 / 3,
  initialPage: 1,
);
CentralPage({Key key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Scaffold(
    body:  Container(
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
            alignment: Alignment(-0.9, 0.6),
            child: Text('Meu Jardim',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff16613D)
              ),
            ),
          ),


          Container(
            //alignment: Alignment.topRight,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: 160.0,
                    color: Colors.red,

                ),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: 160.0,
                  color: Colors.red,
                ),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: 160.0,
                  color: Colors.red,
                ),

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    width: 160.0,
                  color: Colors.red,
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      width: 160.0,
                    color: Colors.red,
                  ),
                  onTap: () {
                   // Navigator.push(
                   //     context,
                       // MaterialPageRoute(builder: (context) => PlantDescription())
                   // );
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment(-0.9, 0.6),
            child: Text('Sugestões para você',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff16613D)
              ),
            ),
          ),


          Container(
            //alignment: Alignment.topRight,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
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
                          child: Text('Hortelã',
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

                        child: Text('Suculentas',
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

                        child: Text('Monte sua horta',
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
        ],
      ),

    ),

  );
}
}

