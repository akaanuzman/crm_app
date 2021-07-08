import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'http://192.168.2.136',
      user = 'admin',
      password = '123',
      db = 'sistem';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
