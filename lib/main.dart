
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jobportal/component/view/login_view.dart';
import 'package:jobportal/component/view/search_view.dart';
import 'package:jobportal/component/view/sign-up_view.dart';

void main() {
  Widget MyApp = MaterialApp(
    initialRoute: "/search",
    routes: {
      "/login" : (context) => const LoginPage(),
      "/signIn" : (context) => const SignInPage(),
      "/search" : (context) => const SearchPage()
     },
  );
  runApp(MyApp);
}