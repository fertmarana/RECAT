import 'package:flutter/material.dart';
import 'package:recat/app.dart';
import 'package:recat/app_usuario_catadores/app_catadores.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}