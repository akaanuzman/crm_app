
import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';

Future<void> name(args) async {
  var settings =  ConnectionSettings(
  host: 'localhost', 
  port: 3306,
  user: 'root',
  password: '',
  db: 'sistem'
);
var conn = await MySqlConnection.connect(settings);

var results = await conn.query('select id from company ');
for (var row in results) {
  debugPrint('id: ${row[0]}');
}
}