import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class agenda_morador extends StatefulWidget {
  @override
  _agenda_morador createState() => _agenda_morador();
}

class _agenda_morador extends State<agenda_morador> {
  CalendarController _controller = CalendarController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Color(0xff16613D)),
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
            IconButton(icon: Icon(Icons.person_outline, color: Color(0xff16613D)),
              // onPressed: () {
              // Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => editperfil()),
              //);},
            ),
          ],
        ),
      body: TableCalendar(
        locale: 'pt_br',
      calendarController: _controller,
    )
    );
  }
}