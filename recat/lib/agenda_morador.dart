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
    return TableCalendar(
      calendarController: _controller,
    );
  }
}