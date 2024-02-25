import 'package:flutter/material.dart';
import 'package:jobportal/component/view/login_view.dart';

void main() {
  Widget MyApp = MaterialApp(
    initialRoute: "/login",
    routes: {
      "/login" : (context) => const LoginPage(),
    },
  );
  runApp(MyApp);
}
