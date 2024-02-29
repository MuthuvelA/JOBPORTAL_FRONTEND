
import 'package:flutter/material.dart';
import 'package:jobportal/component/view/login_view.dart';
import 'package:jobportal/component/view/sign-up_view.dart';

void main() {
  Widget MyApp = MaterialApp(
    initialRoute: "/login",
    routes: {
      "/login" : (context) => const LoginPage(),
      "/signIn" : (context) => const SignInPage(),
    },
  );
  runApp(MyApp);
}