import 'dart:async';

import 'package:mysql1/mysql1.dart';

Future main() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '34.95.164.104', port: 3306, user: 'mestrecuca', password: 'mestrecuca', db: 'mestrecucaapp'));

  // Insert some data
  var result = await conn.query(
      'insert into usuario (nome, email, senha, foto) values (?, ?, ?, ?)',
      ['Bob', 'bob@bob.com', 25]);
  print('Inserted row id=${result.insertId}');

  // Query the database using a parameterized query
  var results = await conn
      .query('select name, email from usuario where id = ?', [result.insertId]);
  for (var row in results) {
    print('Name: ${row[0]}, email: ${row[1]}');
  }

  // Finally, close the connection
  await conn.close();
}