import 'package:flutter/material.dart';


class AgendarColeta_Pag2 extends StatefulWidget {

  @override
  _AgendarColeta_Pag2 createState() => _AgendarColeta_Pag2();
}

class _AgendarColeta_Pag2 extends State<AgendarColeta_Pag2> {
  DateTime pickedDate;
  TimeOfDay time;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.keyboard_backspace_outlined, color: Color(0xff16613D)),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text('',
              style: TextStyle(color: Color(0xff16613D), fontWeight: FontWeight.bold)
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            //IconButton(icon: Icon(Icons.person_outline, color: Color(0xff16613D)),
            // onPressed: () {
            // Navigator.push(
            // context,
            // MaterialPageRoute(builder: (context) => editperfil()),
            //);},
            //),
          ],
        ),
      body: Align(
        alignment: Alignment(0.0,-1),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
            width: 350.0,
            height: 180.0,
            decoration: BoxDecoration(color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 2,),
              borderRadius: BorderRadius.circular(12),
            ),
          child: Align(
              alignment: Alignment(0.0,0.0),
              child: Wrap(
                  children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ListTile(
                                  title: Text("Date: ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day}"),
                                  trailing: Icon(Icons.keyboard_arrow_down),
                                  onTap: _pickDate,
                                ),
                                ListTile(
                                  title: Text("Time: ${time.hour}:${time.minute}"),
                                  trailing: Icon(Icons.keyboard_arrow_down),
                                  onTap: _pickTime,
                                ),
                              ],
                            ),
                          ),
                        ]
                )
            )
          )
      )
    );
  }
  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year+5),
      initialDate: pickedDate,
      helpText: "Selecione Dia",
      cancelText: "Agora não",
      confirmText: "Selecionar",
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    if(date != null)
      setState(() {
        pickedDate = date;
      });
  }
  _pickTime() async {
    TimeOfDay t = await showTimePicker(
        context: context,
        initialTime: time,


    );
    if(t != null)
      setState(() {
        time = t;
      });
  }
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }

}