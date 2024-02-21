// server.dart
import 'dart:async';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:sqljocky/sqljocky.dart';

Future<void> main() async {
  var server = await io.serve(handler, 'localhost', 8080);
  print('Server is running on port ${server.port}');
}

Future<shelf.Response> handler(shelf.Request request) async {
  var pool = new ConnectionPool(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    db: 'dtb',
    max: 5,
  );

  var connection = await MySqlConnection.connect(settings);
      var put_Data = await connection.query(
          "INSERT INTO dtb values(?,?,?,?),[$FistName,$LastName,$Age,$Email,${Password.hashCode}]");

  await pool.close();
void setupLoginForm() {
  querySelector('#loginForm')!.onSubmit.listen((event) {
    event.preventDefault();
    handleLogin();
  });
}

void setupRegistrationForm() {
  querySelector('#registrationForm')!.onSubmit.listen((event) {
    event.preventDefault();
    handleRegistration();
  });
}

void handleLogin() async {
  var settings = new ConnectionSettings(
      host: 'localhost', port: 3306, user: 'root', db: 'dtb');
  var connection = await MySqlConnection.connect(settings);

  var email = (querySelector('#email') as InputElement).value;
  var password = (querySelector('#password') as InputElement).value;

  var values = await connection.query("select * from dtb");
  for (var user in values.toList()) {
    var u = user[2].toString();

    if (u == email) {
      var dbpassword = await connection
          .query("select Password from dtb where email = ?", [email]);
      var dbemail = await connection
          .query("select email from dtb where email = ?", [email]);
      var npassword = dbpassword.toList()[0][0].toString();
      var n_email = dbemail.toList()[0][0].toString();

      if (email == n_email) {
        if (password.hashCode.toString() == npassword.toString()) {
        } else if (password != npassword) {}
      } else if (username != n_username) {}
      connection.close();
    }
  }

  return shelf.Response.ok('Data from MySQL: $data');
}
