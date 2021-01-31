import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';

class WriteandReadfile {
  String filename;

  WriteandReadfile ({
    this.filename,
  });


  Future<String> get _localPath async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    return File('$path/'+filename).create();;
  }

  Future<File> writeString(String texttowrite) async {
    //print('Writing:\n'+texttowrite);
    final file = await _localFile;

    // Write the file.
    return file.writeAsString(texttowrite);
  }


  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      print('Contents');
      print(contents);
      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      return null;
    }
  }


}